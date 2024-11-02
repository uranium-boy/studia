//
//  main.swift
//  lab4
//
//  Created by student on 28/10/2024.
//

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

func toRoman(num : Int) -> String {
    let conversionTable = [
        (1000, "M"),
        (900, "CM"),
        (500, "D"),
        (400, "CD"),
        (100, "C"),
        (90, "XC"),
        (50, "L"),
        (40, "XL"),
        (10, "X"),
        (9, "IX"),
        (5, "V"),
        (4, "IV"),
        (1, "I")
    ]
    
    var roman = ""
    var remaining = num
    
    for (value, symbol) in conversionTable {
        while remaining >= value {
            roman += symbol
            remaining -= value
        }
    }
    return roman
}

func wiek() {
    while true {
        print("Podaj rok")
        guard let year = Int(readLine()!), year >= 2 && year <= 3010 else {
            print("Nieprawidlowy rok")
            continue
        }
        var wiek : Int
        if (year % 100 == 0) {
            wiek = year / 100
        } else {
            wiek = year / 100 + 1
        }
        let rzymskiWiek = toRoman(num: wiek)
        print("Wiek \(rzymskiWiek)")
        break
    }
}

func stypendium() {
    while true {
        print("Podaj srednia: ")
        guard let srednia = Double(readLine()!), srednia >= 2.0 && srednia <= 5.0 else {
            print("Nieprawidlowa wartosc")
            continue
        }
        let stypendium : Int
        switch srednia {
        case 4.5 ... 5.0:
            stypendium = 200
        case 4.0 ..< 4.5:
            stypendium = 150
        case 3.0 ..< 4.0:
            stypendium = 100
        default:
            stypendium  = 0
        }
        print("Wysokosc stypendium: \(stypendium)")
        break
    }
}

func getInt() -> Int {
    while true {
        guard let num = Int(readLine()!) else {
            print("Podaj poprawna liczbe")
            continue
        }
        return num
    }
}

func kalkulator() {
    let menuCalc = """
1. dodawanie
2. odejmowanie
3. mnozenie
4. dzielenie
"""
    while true {
        print(menuCalc)
        let input = getInt()
        if input < 1 || input > 4 {
            print("Nieprawidlowa wartosc")
            continue
        }
        print("Podaj liczbe a:")
        let a = getInt()
        print("Podaj liczbe b:")
        let b = getInt()
        
        if (input == 4 && b == 0) {
            print("Nie mozna podzielic przez 0")
            continue
        }
        
        switch input {
        case 1:
            print("Wynik: \(a + b)")
        case 2:
            print("Wynik: \(a - b)")
        case 3:
            print("Wynik: \(a * b)")
        case 4:
            print("Wynik: \(Double(a) / Double(b))")
        default:
            continue
        }
        break
    }
}

func wojewodztwa() {
    outerloop: while true {
        print("Podaj kod pocztowy")
        guard var input = readLine(), input.count == 6 else {
            print("Nieprawidlowa wartosc")
            continue
        }
        if (input[input.index(input.startIndex, offsetBy: 2)] != "-") {
            print("Brak znaku '-'")
            continue
        }
        input.remove(at: input.index(input.startIndex, offsetBy: 2))
        
        for char in input {
            if (!char.isNumber) {
                print("Kod zawiera niedozwolony znak: \(char)")
                continue outerloop
            }
        }
        
        var wojewodztwo : String
        guard let kod = Int(input.prefix(2)) else {
            continue
        }
        switch kod {
        case 0 ... 9:
            wojewodztwo = "mazowieckie"
        case 10 ... 14:
            wojewodztwo = "warmisno-mazurskie"
        case 15 ... 19:
            wojewodztwo = "podlaskie"
        case 20 ... 25:
            wojewodztwo = "lubelskie"
        case 26 ... 27:
            wojewodztwo = "swietokrzyskie"
        case 28 ... 34:
            wojewodztwo = "malopolskie"
        case 35 ... 39:
            wojewodztwo = "podkarpackie"
        case 40 ... 44:
            wojewodztwo = "slaskie"
        case 45 ... 49:
            wojewodztwo = "opolskie"
        case 50 ... 59:
            wojewodztwo = "dolnoslaskie"
        case 60 ... 64:
            wojewodztwo = "wielkopolskie"
        case 65 ... 69:
            wojewodztwo = "lubuskie"
        case 70 ... 77:
            wojewodztwo = "zachodniopomorskie"
        case 78 ... 84:
            wojewodztwo = "pomorskie"
        case 85 ... 89:
            wojewodztwo = "kujawsko-pomorskie"
        case 90 ... 94:
            wojewodztwo = "lodzkie"
        default:
            print("Takie wojewodztwo nie istnieje")
            continue outerloop
        }
        print("Wojewodztwo \(wojewodztwo)")
        break
    }
}

func symbole() {
    while true {
        print("Podaj znak:")
        if let input = readLine(), !input.isEmpty {
            let char = input[input.startIndex].lowercased()
            switch char {
            case "a","e","i","o","u","ą","ę":
                print("Samogloska")
            case "b","c","d","f","g","h","j","k","l","m","n","p","q","r","s","t","v","w","x","y","z":
                print("Spolgloska")
            case "0","1","2","3","4","5","6","7","8","9":
                print("Cyfra")
            default:
                print("Inny znak")
            }
            break
        } 
    }
}

func pesel() {
    outerloop: while true {
        print("Podaj PESEL:")
        if let input = readLine(), input.count == 11 {
            for char in input {
                if (!char.isNumber) {
                    print("Kod zawiera niedozwolony znak: \(char)")
                    continue outerloop
                }
            }
            guard let sex = Int(String(input[input.index(input.startIndex, offsetBy: 10)])) else {
                print("???")
                break outerloop
            }
            if (sex % 2 == 0) {
                print("Kobita")
            } else {
                print("Chlop")
            }
            break outerloop
        } else {
            print("Kod zawiera nieprawidlowa ilosc cyfr")
            continue
        }
    }
}

let menu = """
    1. Rok przestepny
    2. Wiek
    3. Stypendium
    4. Kalkulator
    5. Wojewodztwa
    6. Symbole
    7. Pesel
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
    case 3:
        stypendium()
    case 4:
        kalkulator()
    case 5:
        wojewodztwa()
    case 6:
        symbole()
    case 7:
        pesel()
    case 0:
        break menuloop
    default:
        print("Liczba spoza zakresu")
        continue
    }
}
