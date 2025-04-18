const express = require('express')
const path = require('path')
const bodyParser = require('body-parser')
const { check, validationResult } = require('express-validator')
const PORT = 3000

const { users } = require("./users.js")
const { emitWarning } = require('process')

const app = express()

app.use(bodyParser.urlencoded({ extended: true }))

app.get('/', (req, res) => {
    res.send("Prosty serwer oparty na szkielecie programistycznym Express")
})

app.get('/about', (req, res) => {
    res.send("Autor strony: Maciej Janczara")
})

app.get('/name/:name1/:name2', (req, res) => {
    res.status(200)
    res.type('text/html')
    res.send(`Cześć ${req.params['name1']} i ${req.params['name2']}`)
})

app.get('/form', (req, res) => {
    res.sendFile(path.join(__dirname, "form.html"))
})

app.post('/result', (req, res) => {
    let username = req.body.username
    let password = req.body.password

    if (!username || !password) {
        res.send('UZUPEŁNIJ DANE !!!!11')
    } else {
        res.send("Użytkownik: " + username + "<br>Hasło: " + password)
    }
})

app.get('/form2', (req, res) => {
    res.sendFile(path.join(__dirname, "form2.html"))
})

app.post('/result2', (req, res) => {
    let name = req.body.name
    let languages = req.body.languages

    if (!name || !languages) {
        res.send("Uzypełnij dane!!!!!")
    } else {
        if (!Array.isArray(languages)) {
            languages = [languages]
        }
        const listItems = languages.map(lang => `<li>${lang}</li>`).join('')
        res.send(`Użytkownik: ${name}<br>Znajomość języków:<br><ul>${listItems}</ul>`)
    }
})

app.get('/form3', (req, res) => {
    res.sendFile(path.join(__dirname, "form3.html"))
})

const letInitials = value => {
    return value
        .split(/\s+/)
        .map(word => word[0] || '')
        .join('')
        .toUpperCase()
}

app.post('/form3', [
    check('username')
        .trim()
        .stripLow()
        .isLength({ min: 3, max: 25 }).withMessage("Nazwisko musi mieć przynajmniej 3 i maksymalnie 25 liter")
        .bail()
        .isAlpha().withMessage("nazwisko nie może zawierać innych znaków")
        .customSanitizer(value => {
            return letInitials(value)
    }),
    check('email')
        .normalizeEmail()
        .isEmail().withMessage("email nie jest prawidłowy"),
    check('age')
        .trim()
        .stripLow()
        .isInt({ min: 0, max: 110 }).withMessage("wiek musi być liczbą w zakresie [0; 110]")
], (req, res) => {
        const errors = validationResult(req)
        if (!errors.isEmpty()) {
            return res.status(422).json({ errors: errors.array() })
        }
        const username = req.body.username
        const email = req.body.email
        const age = req.body.age
        res.send("Użytownik: " + username + "<br>Email: " + email + "<br>Wiek: " + age)
})

app.get('/api/users', (req, res) => {
    res.json(users)
})

app.get('/api/users/:id', (req, res) => {
    const found = users.some(user => user.id === parseInt(req.params.id))
    if (found) {
        res.json(users.filter(user => user.id === parseInt(req.params.id)))
    } else {
        res.status(400).json({msg: `Użytkownik o id ${req.params.id} nie został odnaleziony`})
    }
})

app.post('/api/users', (req, res) => {
    const newUser = {
        id: users.length + 1,
        name: req.body.name,
        email: req.body.email,
        status: "aktywny"
    }

    if (!newUser.name || !newUser.email) {
        return res.status(400).json({msg: 'Wprowadź poprawne imię i nazwisko oraz email!!!!!!!!@!'})
    }
    users.push(newUser)
    res.json(users)
})

app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`)
})
