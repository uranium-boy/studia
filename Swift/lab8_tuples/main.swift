import Foundation

func getName(text: String) -> String {
    while true {
        print(text, terminator: ": ")
        guard let input = readLine(), !input.isEmpty else {
            print("Podaj poprawne imię.")
            continue
        }

        if let first = input.first, first.isUppercase,
            input.unicodeScalars.allSatisfy({ CharacterSet.letters.contains($0) }) {
            return input
        } else {
            print("Imię nie spełnia wymogów.")
        }
    }
}

func getInt(text: String, min: Int, max: Int) -> Int {
    while true {
        print(text, terminator: ": ")
        guard let num = Int(readLine()!), num >= min && num <= max else {
            print("Nieprawidłowa wartość")
            continue
        }
        return num
    }
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

func person() {
    var people: [(firstName: String, lastName: String, birthYear: Int)] = []

    for i in 0 ..< 2 {
        let firstName = getName(text: "Podaj imię \(i + 1). osoby")
        let lastName = getName(text: "Podaj nazwisko \(i + 1). osoby")
        let birthYear = getInt(text: "Podaj rok urodzenia \(i + 1). osoby", min: 1900, max: 2024)
        people.append((firstName: firstName, lastName: lastName, birthYear: birthYear))
    }

    if (people[0].birthYear > people[1].birthYear) {
        print("\(people[0].firstName) \(people[0].lastName) jest młodsz_ niż \(people[1].firstName) \(people[1].lastName)")
    }
    else if (people[0].birthYear == people[1].birthYear) {
        print("\(people[0].firstName) \(people[0].lastName) jest w tym samym wieku co \(people[1].firstName) \(people[1].lastName)")
    }
    else {
        print("\(people[0].firstName) \(people[0].lastName) jest starsz_ niż \(people[1].firstName) \(people[1].lastName)")
    }
}

func student() {
    var students: [(lastName: String, grades: [Double], average: Double)] = []

    for i in 0 ..< 3 {
        let name = getName(text: "Podaj imię \(i + 1). studenta")
        var grades: [Double] = []
        var avg: Double = 0

        for j in 0 ..< 3 {
            let grade = getDouble(text: "Podaj \(j + 1). ocenę", min: 2.0, max: 5.0)
            grades.append(grade)
            avg += grade
        }
        students.append((lastName: name, grades: grades, average: avg / 3))
    }

    let sortedStudents = students.sorted { $0.average < $1.average }
    for student in sortedStudents {
        print("\(student.lastName): \(student.average)")
    }
}

func apartments(st: Bool) {
    enum Standard: Int {
        case wysoki = 1, średni, niski, NN

        init?(number: Int) {
            guard let standard = Standard(rawValue: number) else {
                return nil
            }
            self = standard
        }
    }
    var apartments: [(location: String, area: Double, pricePerMeter: Double, standard: Standard, totalPrice: Double)] = []

    let num = getInt(text: "Wprowadź ilość mieszkań", min: 1, max: Int.max)

    for _ in 0 ..< num {
        let loc = getName(text: "Podaj lokalizację")
        let area = getDouble(text: "Podaj powierzchnię", min: 1, max: Double(Int.max))
        let price = getDouble(text: "Podaj cenę za metr", min: 0, max: Double(INT_MAX))

        if st {
            let num = getInt(text: "Podaj standard (1: wysoki, 2: średni, 3: niski)", min: 1, max: 3)
            if let stand = Standard(number: num) {
                apartments.append((location: loc, area: area, pricePerMeter: price, standard: stand, totalPrice: area * price))
            } else {
                print("Błąd")
            }
        } else {
            if let stand = Standard(number: 4) {
                apartments.append((location: loc, area: area, pricePerMeter: price, standard: stand, totalPrice: area * price))
            } else {
                print("Błąd")
            }
        }
    }

    if let highest = apartments.max(by: { $0.totalPrice < $1.totalPrice }),
       let lowest = apartments.min(by: { $0.totalPrice < $1.totalPrice }) {
            print("Najdroższe mieszkanie\nLokalizacja: \(highest.location), powierzchnia: \(highest.area), cena za metr: \(highest.pricePerMeter)", terminator: "")
        if st {
            print(", standard: \(highest.standard)")
        } else { print() }
            print("Najtańsze mieszkanie\nLokalizacja: \(lowest.location), powierzchnia: \(lowest.area), cena za metr: \(lowest.pricePerMeter)", terminator: "")
        if st {
            print(", standard: \(lowest.standard)")
        } else { print() }
    }
}

func months() {
    enum Month: Int {
        case Styczeń = 1, Luty, Marzec, Kwiecień, Maj, Czerwiec, Lipiec, Sierpień, Wrzesień, Październik, Listopad, Grudzień

        var season: String {
            switch self {
            case .Styczeń, .Luty, .Grudzień:
                return "Zima"
            case .Marzec, .Kwiecień, .Maj:
                return "Wiosna"
            case .Czerwiec, .Lipiec, .Sierpień:
                return "Lato"
            case .Wrzesień, .Październik, .Listopad:
                return "Jesień"
            }
        }

        init?(number: Int) {
            guard let month = Month(rawValue: number) else {
                return nil
            }
            self = month
        }
    }

    let num = getInt(text: "Podaj numer miesiąca", min: 1, max: 12)

    if let month = Month(number: num) {
        print("Miesiąc: \(month), pora roku: \(month.season)")
    } else {
        print("???")
    }
}

let menu = """
1. Osoba
2. Student
3. Mieszkania
4. Miesiące
5. Mieszkania ze standardem
0. Wyjście z programu
"""

menuloop: while true {
    print(menu)
    guard let choice = Int(readLine()!) else {
        print("Niepoprawna wartość")
        continue
    }

    switch choice {
    case 1:
        person()
    case 2:
        student()
    case 3:
        apartments(st: false)
    case 4:
        months()
    case 5:
        apartments(st: true)
    case 0:
        break menuloop
    default:
        print("Niepoprawna wartość")
    }
}
