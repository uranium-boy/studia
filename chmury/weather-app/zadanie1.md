# Weather App
## Budowa kontenera
`docker build -t weather_app .`
## Uruchomienie kontenera
__UWAGA__
Aby uruchomić aplikację, należy w tym kroku wyeksportować klucz API do serwisu openweathermap.org jako zmienną środowiskową:
`docker run -d -p 3000:3000 --env-file .\src\.env --name weather_app_container weather_app`
## Generowanie informacji
Po uruchomieniu kontenera informacje o autorze, dacie uruchomienia oraz porcie, na którym nasłuchuje serwer są logowane poleceniem `console.log()` i można uzyskać do nich dostęp przez zakładkę `Logs` w Docker Desktop.
## Weryfikacja warstw
`docker history weather_app`
