import express from 'express'

const PORT = 3000
const API_KEY = process.env.API_KEY
const app = express()

if (!API_KEY) {
    console.error('API key not provided')
    process.exit(1)
}

const countries = {
    PL: { name: 'Poland', cities: ['Warsaw', 'Lublin'] },
    MT: { name: 'Malta', cities: ['Valetta', 'Rabat'] },
    MZ: { name: 'Mozambique', cities: ['Maputo', 'Beira'] },
    MN: { name: 'Mongolia', cities: ['Ulaanbaatar', 'Bayankhongor'] },
    MM: { name: 'Myanmar', cities: ['Yangon', 'Naypyidaw'] }
}

app.set('view engine', 'ejs')
app.use(express.urlencoded({ extended: true }))

async function fetchWeather(country, city) {
    const url = `https://api.openweathermap.org/data/2.5/weather?q=${city},${country}&appid=${API_KEY}&units=metric`
    const response = await fetch(url)

    const data = await response.json()

    if (!response.ok) {
        const { message } = data
        const err = new Error(`API request error: ${response.statusText}`)
        err.status = response.status
        err.details = message
        throw err
    }

    return data
}

app.get('/', (_, res) => {
    res.render('form', {
        countries,
        weatherData: null
    })
})

app.post('/', async (req, res) => {
    const { country, city } = req.body

    try {
        const weatherData = await fetchWeather(country, city)
        res.render('form', {
            countries,
            weatherData
        })
    } catch (error) {
        console.log(error)
        res.status(500).send(`${error.message} ${error.status}<br>${error.details}`)
    }
})

app.listen(PORT, () => {
    console.log(`Application author: Maciej Janczara`)
    console.log(`Launch date: ${Date()}`)
    console.log(`Server running on port: ${PORT}`)
})
