//
//  main.swift
//  lab3_string
//
//  Created by student on 21/10/2024.
//

import Foundation

func multiline() {
    let singleLine = "Lancuch jednoliniowy"
    let multiLine = """
        Lancuch
        Wielo-
        -linijkowy
        """
    print(singleLine)
    print(multiLine)
}

func formatted() {
    let text = """
    \tNauka kodowania to nie tylko nauka języka technologii.\n
    \tTo odkrywanie nowych sposobów myślenia\n
    \ti urzeczywistnianie rozmaitych koncepcji.\n
    """
    print(text)
}

func concatenate() {
    func isValid(text : String) -> Bool {
        var result = true
        text.forEach {
            if ($0.isLetter != true) {
                result = false
            }
        }
        return result
    }
    
    func getName() -> String {
        while true {
            if let input = readLine(), isValid(text: input) {
                return input
            }
            else {
                print("Nieprawidlowa wartosc")
            }
        }
    }
    
    func getYear() -> Int {
        while true {
            if let input = readLine(), let number = Int(input), number >= 1900 && number <= 2024 {
                return  number
            }
            else {
                print("Nieprawidlowa wartosc")
            }
        }
    }
    let currentYear = 2024
    var firstName, middleName, lastName : String
    var birthYear : Int
    
    print("Podaj imie:")
    firstName = getName()
    print("Podaj drugie imie:")
    middleName = getName()
    print("Podaj nazwisko:")
    lastName = getName()
    print("Podaj swoj rok urodzenia:")
    birthYear = getYear()
    
    var full = firstName
    full.append(" ")
    full.insert(contentsOf: middleName, at: full.endIndex)
    full.append(" ")
    full.insert(contentsOf: lastName, at: full.endIndex)
    full.append(" ")
    let stringYear = "\(birthYear)"
    full.insert(contentsOf: stringYear, at: full.endIndex)
    print(full)
    
    if let range = full.range(of: middleName) {
        full.removeSubrange(range)
    }
    print ("Usuwam drugie imie: \(full)")
    if let range = full.range(of: stringYear) {
        full.removeSubrange(range)
    }
    full.insert(contentsOf: "\(currentYear - birthYear)", at: full.endIndex)
    print("Dodaje wiek: \(full)")
    
    if (firstName[firstName.startIndex] == "D" || firstName[firstName.startIndex] == "d") {
        print("Imie zaczyna sie od litery D")
    }
    else {
        print("Imie nie zaczyna sie od litery D")
    }
}

func getString() -> String {
    while true {
        if let input = readLine(), !input.isEmpty {
            return input
        }
    }
}
func getChar() -> Character {
    while true {
        if let input = readLine(), !input.isEmpty {
            let tmpString : String = input
            return tmpString[tmpString.startIndex]
        }
    }
}
func getInt() -> Int {
    while true {
        if let input = readLine(), let tmpInt = Int(input) {
            return tmpInt
        }
    }
}
func searchLetter() {
    var str : String
    var char : Character
    var number : Int
    
    print("Wpisz dowolny ciag:")
    str = getString()
    print("Wpisz znak:")
    char = getChar()
    print("Podaj dowolna liczbe calkowita:")
    number = getInt()
    
    if (str[str.startIndex] == char) {
        print("Znak znajduje sie na poczatku ciagu")
    }
    else if (str[str.index(str.startIndex, offsetBy: number)] == char) {
        print("Znak znajduje sie na \(number) indeksie ciagu")
    }
    else if (str[str.index(str.endIndex, offsetBy: -number)] == char) {
        print("Znak znajduje sie na \(-number) indeksie ciagu")
    }
    else if (str[str.endIndex] == char) {
        print("Znak znajduje sie na koncu ciagu")
    }
}

func compare() {
    print("podaj string a:")
    var strA : String = getString()
    print("podaj string b:")
    var strB = getString()
    
    if (strA == strB) {
        print("Podane ciagi sa identyczne")
    }
    
    var prefix = getString()
    var sufix = getString()
    
    if (strA.contains(prefix)) {
        print("string a zawiera prefiks")
    }
    if (strA.contains(sufix)) {
        print("string a zawiera sufiks")
    }
    if (strA.contains(prefix)) {
        print("string b zawiera prefiks")
    }
    if (strA.contains(sufix)) {
        print("string a zawiera sufix")
    }
}

func rectangle() {
    print("Podaj wymiar a:")
    let a = getInt()
    print("Podaj wymiar b:")
    let b = getInt()
    
    let string = "Obwod: \(2*a + 2*b)\nPole: \(a*b)"
    print(string)
}

func waluty() {
    print("Podaj kwote w PLN:")
}


let menu = """
    1. Lancuchy wieloliniowe
    2. Tekst sformatowany
    3. Laczenie lancuchow
    4. Szukanie znaku
    5. Porownywanie ciagow
    6. Prostokat
    7. Waluty
    0. Wyjscie
    """

var input: Int = 1
menuloop: while true {
    print(menu)
    
    if let userInput = readLine(), let number = Int(userInput), number >= 0 {
        input = number
    }
    else {
        print("Nieprawidlowa wartosc")
        continue
    }
    
    switch input {
    case 0:
        break menuloop
    case 1:
        multiline()
    case 2:
        formatted()
    case 3:
        concatenate()
    case 4:
        searchLetter()
    case 5:
        compare()
    case 6:
        rectangle()
    case 7:
        waluty()
    default:
        continue
    }
}
