import express from 'express'

const PORT = 3000

const app = express()

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

    if (!response.ok) {
        throw new Error(`Request Error: ${response.statusText}`)
    }

    const data = await response.json()
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
        res.status(500).send(error)
    }
})

app.listen(PORT, () => {
    console.log(`Server running on port: ${PORT}`)
})
