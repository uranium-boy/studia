import Foundation

func getInt(text: String) -> Int {
    while true {
        print(text)

        guard let num = Int(readLine()!) else {
            print("Nieprawidłowa wartość")
            continue
        }
        return num
    }
}

func randNums() {
    func getSmallest(arr: [Int]) -> Int {
        return arr.min()!
    }
    func getBigest(arr: [Int]) -> Int {
        return arr.max()!
    }
    func getBoth(arr: [Int]) -> (smallest: Int, biggest: Int) {
        return (getSmallest(arr: arr), getBigest(arr: arr))
    }

    var array: [Int] = []

    for _ in 0 ..< 3 {
        let tmp = Int.random(in: 0 ... 99)
        print("Wygenerowana liczba: \(tmp)")
        array.append(tmp)
    }

    print("Największa liczba: \(getBigest(arr: array))")
    print("Najmniejsza liczba: \(getSmallest(arr: array))")
    let both = getBoth(arr: array)
    print("Najmniejsza: \(both.smallest), największa: \(both.biggest)")
}

class Person {
    var firstName, lastName : String
    var birthYear : Int

    init(firstName: String, lastName: String, birthYear: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.birthYear = birthYear
    }

    init() {
        print("Imię studenta: ")
        self.firstName = readLine() ?? "Default"

        print("Nazwisko studenta:")
        self.lastName = readLine() ?? "Default"

        self.birthYear = getInt(text: "Rok urodzenia:")

    }

    func show() {
        print("Dane osoby\nImię: \(firstName)\nNazwisko: \(lastName)\nRok urodzenia: \(birthYear)\n")
    }

    func getAge(year: Int) -> Int {
        return year - birthYear
    }
}

func people() {
    let p1 = Person(firstName: "John", lastName: "Pork", birthYear: 1984)
    let p2 = Person(firstName: "Skibidi", lastName: "Toilet", birthYear: 2024)

    p1.show()
    p2.show()
    print("Wiek osoby p1: \(p1.getAge(year: 2025))\nWiek osoby p2: \(p2.getAge(year: 2025))")
}

enum Position {
    case ceo, manager, human_garbage
}

class Employee : Person {
    var employmentYear: Int
    var position: Position
    var hourly: Double
    var workHours: Int
    var companyName: String

    init(firstName: String, lastName: String, birthYear: Int, employmentYear: Int, position: Position, hourly: Double, workHours: Int, companyName: String) {
        self.employmentYear = employmentYear
        self.position = position
        self.hourly = hourly
        self.workHours = workHours
        self.companyName = companyName
        super.init(firstName: firstName, lastName: lastName, birthYear: birthYear)
    }

    override func show() {
        super.show()
        print("Dane pracownika\nRok zatrudnienia: \(employmentYear)\nPozycja: \(position)\nStawka godzinowa: \(hourly)\nPrzepracowane godziny: \(workHours)\nNazwa firmy: \(companyName)\n")
    }
}

func employees() {
    let e1 = Employee(firstName: "Alexander", lastName: "Pushkin", birthYear: 1799, employmentYear: 1820, position: Position.human_garbage, hourly: 21.37, workHours: 420, companyName: "Ruslan and Ludmila Ltd")

    e1.show()
}

enum Field: Int, CaseIterable {
    case math = 1, physics, cs

    init? (number: Int) {
        guard let field = Field(rawValue: number) else {
            print("Nieprawidłowa wartość, domyślny kierunek: Matematyka")
            return nil
        }
        self = field
    }

    static func show() {
        print(Field.allCases)
    }
}

class Student : Person {
    var id: Int
    var field: Field
    var year: Int
    var grades: [Int] = []

    override init() {
        self.id = getInt(text: "Wprowadź numer indeksu:")

        print("Kierunki studiów:")
        Field.show()
        self.field = Field.init(number: getInt(text: "Wprowadź numer kierunku:")) ?? Field.math

        self.year = getInt(text: "Podaj rok stydiów:")

        for i in 0 ..< 5 {
            grades.append(getInt(text: "Wprowadź ocenę z przedmiotu \(i)"))
        }

        super.init()
    }

    override func show() {
        super.show()
        print("Numer indeksu: \(id)\nKierunek studiów: \(field)\nRok studiów: \(year)\nOceny studenta: \(grades)")
    }
}

func students() {
    let s1 = Student()
    s1.show()
}

let menu = """
1. Random numbers
5. Osoba
6. Pracownik
113. Student
0. Exit
"""

menuloop: while true {
    print(menu)

    let input = getInt(text: "Wpisz: ")

    switch input {
    case 1:
        randNums()
    case 5:
        people()
    case 6:
        employees()
    case 113:
        students()
    case 0:
        break menuloop
    default:
        print("Nieprawidłowa wartość")
    }
}
