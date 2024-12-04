import Foundation

func getInt(text: String, min: Int, max: Int) -> Int {
    while true {
        print(text, terminator: ": ")
        guard let number = Int(readLine()!), number >= min && number <= max else {
            print("Nieprawidłowa wartość")
            continue
        }
        return number
    }
}

struct complexNumber {
    var real: Int
    var imaginary: Int
}

func getComplex() -> complexNumber {
    while true {
        print("Wprowadź liczbę zespoloną w formacie (a + bi): ", terminator: "")
        guard let input = readLine(), !input.isEmpty else {
            print("Podana wartość nie może być pusta")
            continue
        }
        let elements = input.split(separator: " ")
        if elements.count != 3 {
            print("Liczba musi składać się z 3 częsci rozdzielonych spacją")
            continue
        }
        guard let realPart = Int(elements[0]) else {
            print("Część rzeczywista nie jest liczbą")
            continue
        }
        guard elements[1].count == 1, let sign = elements[1].first, sign == "+" || sign == "-" else {
            print("Wprowadzony znak `\(elements[1])` jest nieprawidłowy")
            continue
        }
        guard elements[2].last == "i" || elements[2].last == "j", var imaginaryPart = Int(elements[2].dropLast()) else {
            print("Część urojona nie jest liczbą")
            continue
        }

        imaginaryPart = sign == "+" ? imaginaryPart : -imaginaryPart
        return complexNumber(real: realPart, imaginary: imaginaryPart)
    }
}

func printComplex(num: complexNumber) {
    let sign = num.imaginary < 0 ? "-" : "+"
    print("\(num.real) \(sign) \(abs(num.imaginary))i")
}

func getOperation() -> Character {
    while true {
        print("Wybierz rodzaj operacji jaką chcesz wykonać (+, -, *): ", terminator: "")
        guard let input = readLine(), input.count == 1,
            let op = input.first, op == "+" || op == "-" || op == "*" else {
                print("Nieprawidłowy rodzaj operacji")
                continue
        }
        return op
    }
}

func complex_numbers() {
    var nums: [complexNumber] = []

    print("Wpisz 2 liczby zespolone")
    for _ in 0 ..< 2 {
        nums.append(getComplex())
    }

    var result: complexNumber
    let op = getOperation()
    switch op {
    case "+":
        result = complexNumber(real: nums[0].real + nums[1].real, imaginary: nums[0].imaginary + nums[1].imaginary)
    case "-":
        result = complexNumber(real: nums[0].real - nums[1].real, imaginary: nums[0].imaginary - nums[1].imaginary)
    case "*":
        result = complexNumber(real: nums[0].real * nums[1].real - nums[0].imaginary * nums[1].imaginary, imaginary: nums[0].real * nums[1].imaginary + nums[0].imaginary * nums[1].real)
    default:
        print("If you see this, something went wrong...")
        exit(EXIT_FAILURE)
    }

    print("\nWynik operacji:")
    printComplex(num: result)
    print()
}

func getDouble(text: String, min: Double, max: Double) -> Double {
    while true {
        print(text, terminator: ": ")
        guard let num = Double(readLine()!), num >= min && num <= max else {
            print("Nieprawidłowa wartość")
            continue
        }
        return num
    }
}

func getString() -> String {
    while true {
        guard let input = readLine(), !input.isEmpty else {
            print("Nieprawidłowa wartość")
            continue
        }
        return input
    }
}

func javelin() {
    struct javelinThrow {
        var competitorID: String
        var distance: [Double] = []
    }

    var competitors: [javelinThrow] = []
    var highestAvg: Double = 0
    var lowestAvg: Double = 0
    var bestIndex: Int = 0
    var worstIndex: Int = 0

    print("Czy chcesz wpisywać dane ręcznie? (0/1)", terminator: "")
    let choice = getInt(text: "", min: 0, max: 1)
    for i in 0 ..< 4 {
        var avg: Double = 0
        var id: String
        var attempts: [Double]
        if choice == 0 {
            id = String("00\(i+1)")
            print("Zawodnik \(id):")
            attempts = []
            for j in 0 ..< 3 {
                var attempt = Double.random(in: 10.0 ..< 100.0)
                attempt = round(attempt * 100) / 100.0
                print("\(j+1). próba: \(attempt)")
                attempts.append(attempt)
                avg += attempt
            }
        } else {
            print("Podaj ID \(i + 1). zawodnika: ")
            id = getString()
            attempts = []
            for j in 0 ..< 3 {
                let attempt = getDouble(text: "Podaj odległość w \(j + 1). próbie", min: 0.0, max: Double(Int.max))
                avg += attempt
                attempts.append(attempt)
            }
        }
        avg /= 3
        avg = round(avg * 100) / 100.0
        if i == 0 {
            lowestAvg = avg
            worstIndex = 0
        }
        if avg > highestAvg {
            bestIndex = i
            highestAvg = avg
        } else if avg < lowestAvg {
            worstIndex = i
            lowestAvg = avg
        }
        competitors.append(javelinThrow(competitorID: id, distance: attempts))
    }

    print("Najgorszy zawodnik: \(competitors[worstIndex].competitorID), średnia: \(lowestAvg)")
    print("Najlepszy zawodnik: \(competitors[bestIndex].competitorID), średnia: \(highestAvg)")
    competitors.remove(at: worstIndex)
    print("\nPozostali zawodnicy:")
    for competitor in competitors {
        print(competitor.competitorID)
    }
    print()
}

func cars() {
    var cars: Set<String> = [
        "Daewoo Tico",
        "Fiat Seicento",
        "Fiat Cinquecento",
        "Polonez",
        "Skoda Felicia",
        "Volkswagen Golf",
    ]

    if getInt(text: "Czy chesz wprowadzić modele ręcznie (0/1)", min: 0, max: 1) == 1 {
        cars = []
        for i in 0 ..< 6 {
            print("Wprowadź \(i+1). model: ", terminator: "")
            cars.insert(getString())
        }
    }
    print("\nModele:")
    for model in cars {
        print(model)
    }
    print()

    while true {
        print("Wybierz model do usunięcia: ", terminator: "")
        let rm = getString()
        if cars.contains(rm) {
            cars.remove(rm)
            break
        } else {
            print("Zbiór nie zawiera podanego modelu")
            continue
        }
    }

    print("\nModele:")
    for model in cars {
        print(model)
    }
    print()
}

func students() {
    var students: [String: String] = [:]

    if getInt(text: "Czy chcesz podawać dane ręcznie? (0/1)", min: 0, max: 1) == 0 {
        for i in 0 ..< 5 {
            let lastname = String("Student\(i+1)")
            let id = String("000\(i+1)")
            students[lastname] = id
        }
    } else {
        for i in 0 ..< 5 {
            print("Podaj nazwisko \(i+1). studenta: ", terminator: "")
            let lastname = getString()
            print("Podaj identyfikator \(i+1). studenta: ", terminator: "")
            let id = getString()
            students[lastname] = id
        }
    }
    print("\nDane studentów:")
    for (lastname, id) in students {
        print("\(lastname): \(id)")
    }
    while true {
        print("\nPodaj nazwisko lub identyfikator studenta: ", terminator: "")
        let search = getString()
        if let id = students[search] {
            print("Nazwisko: \(search), indentyfikator: \(id)")
            students.removeValue(forKey: search)
        } else if let index = students.firstIndex(where: { $0.value == search }) {
            print("Nazwisko: \(students[index].key), identyfikator: \(students[index].value)")
            students.removeValue(forKey: students[index].key)
        } else {
            print("Nie znaleziono studenta")
            continue
        }
        break
    }

    print("\nPozostali studenci:")
    for (lastname, id) in students {
        print("\(lastname): \(id)")
    }

    print()
}

func flights() {
    struct flights {
        var departure: [Int : String] = [:]
        var arrival: [Int : String] = [:]
        var flightTime: Int
    }

    var flightData: [flights] = []
    var avgTime = 0

    let num = getInt(text: "Podaj ilość lotów", min: 1, max: Int.max)
    if getInt(text: "Czy chcesz wprowadzić dane ręcznie? (0/1)", min: 0, max: 1) == 0 {
        for i in 0 ..< num {
            let dep = [i : String("Airport\(i)")]
            let arr = [i + num : String("Airport\(i+num)")]
            let time = Int.random(in: 30 ..< 1440)
            flightData.append(flights(departure: dep, arrival: arr, flightTime: time))
            avgTime += time
            print("Lot \(i+1)\nWylot: lotnisko #\(dep.keys.first!) \(dep.values.first!), Przylot: lotnisko #\(arr.keys.first!) \(arr.values.first!), Czas lotu: \(time) minut")
        }
    } else {
        for i in 0 ..< num {
            print("Dane dla lotu \(i + 1)")

            let depCode = getInt(text: "Podaj kod lotniska wylotu", min: 0, max: Int.max)
            print("Podaj nazwę lotniska wylotu", terminator: ": ")
            let depName = getString()
            let dep = [depCode : depName]

            let arrCode = getInt(text: "Podaj kod lotniska przylotu", min: 0, max: Int.max)
            print("Podaj nazwę lotniska przylotu", terminator: ": ")
            let arrName = getString()
            let arr = [arrCode : arrName]

            let time = getInt(text: "Podaj czas lotu", min: 0, max: Int.max)

            flightData.append(flights(departure: dep, arrival: arr, flightTime: time))
        }
    }
    avgTime /= num

    print("\nŚrednia długość lotu: \(avgTime)\n")

    flightData.removeAll { $0.flightTime < avgTime }

//    let longFlights = flightData.filter { $0.flightTime > avgTime }
    print("Loty dłuższe niż średnia wszystkich:")
    for flight in flightData {
        if let dep = flight.departure.first, let arr = flight.arrival.first {
            let data = """
                Wylot:
                Nazwa lotniska: \(dep.value), Kod lotniska: #\(dep.key)
                Przylot:
                Nazwa lotniska: \(arr.value), Kod lotniska: #\(dep.key)
                Czas lotu: \(flight.flightTime)\n
            """
            print(data)
        } else {
            print("Błąd wyświetlania danych")
        }
    }
}

let menu = """
1. Liczby zespolone
2. Rzut oszczepem
3. Samochody
4. Studenci
5. Loty
0. Wyjście z programu
"""

menuloop: while true {
    print(menu)
    guard let choice = Int(readLine()!) else {
        print("Niepoprawna wartość")
        continue
    }
    print()

    switch choice {
    case 1:
        complex_numbers()
    case 2:
        javelin()
    case 3:
        cars()
    case 4:
        students()
    case 5:
        flights()
    case 0:
        break menuloop
    default:
        print("Niepoprawna wartość")
    }
}
