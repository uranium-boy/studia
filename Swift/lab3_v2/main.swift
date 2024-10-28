// The Swift Programming Language
// https://docs.swift.org/swift-book

import Foundation

func rok() {
    while true {
        print("Podaj rok:")
        guard let year = Int(readLine()!) else {
            print("Podaj prawidlowy rok")
            continue
        }
        if (year % 4 == 0 && year % 100 != 0) {
            print("Rok przestepny")
        } else {
            print("Nie rok przestepny")
        }
        break
    }
}

func wiek() {
    while true {
        print("Podaj rok")
        guard let year = Int(readLine()!), year >= 2 && year <= 3010 else {
            print("Nieprawidlowy rok")
            continue
        }
        print(year)
    }
}

let menu = """
    1. Rok przestepny
    2. Wiek
    0. Wyjscie z programu
    """

menuloop: while true {
    print(menu)
    guard let num = Int(readLine()!) else {
        print("Nieprawidlowa wartosc")
        continue
    }
    switch num {
        case 1:
            rok()
        case 2:
            wiek()
        case 0:
            break menuloop
        default:
            print("Liczba spoza zakresu")
            continue
    }
}