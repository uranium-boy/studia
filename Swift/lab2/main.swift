//
//  main.swift
//  lab2
//
//  Created by student on 14/10/2024.
//

import Foundation

func wiek()
{
    let currentYear = 2024
    while true {
        print("Podaj rok urodzenia: ")
        if let typedValue = readLine() {
            if let typedYear = Int(typedValue), typedYear >= 1900 && typedYear <= 2024 {
                let age = currentYear - typedYear
                print("Masz \(age) lat.")
                break
            }
            else {
                print("Nieprawidlowa wartosc")
            }
        }
    }
}

func kolo()
{
    let PI = 3.1415
    
    outerloop: while true {
        print("Podaj promien kola: ")
        if let typedValue = readLine() {
            if let radius = Double(typedValue), radius > 0 {
                print(String(format: """
                    Promien: %.2f
                    Obwod: %.2f
                    Pole: %.2f
                    """, radius, 2 * PI * radius, PI * radius * radius))
                break outerloop
            }
        }
    }
}

func szescian()
{
    outerloop: while true {
        print("Podaj bok szescianu: ")
        if let typedValue = readLine() {
            if let length = Double(typedValue), length > 0 {
                print(String(format: """
                    Dlugosc boku: %.2f
                    Pole: %.2f
                    Objetosc: %.2f
                    """, length, 6 * length * length, length * length * length))
                break outerloop
            }
        }
    }
}

func listwa()
{
    outerloop: while true {
        var a, b, z : Int
        print("Wymiar pokoju a: ")
        if let input = Int(readLine()) {
            if let
            if let inputInt = Int
        }
        else {
            
        }
    }
}

let menu = """
    1. Obliczanie wieku
    2. Kolo
    3. Szescian
    0. Wyjscie
    """

outerLoop: while (true) {
    print(menu)
    if let input = readLine() {
        if let inputInt = Int(input) {
            switch inputInt {
            case 0:
                break outerLoop
            case 1:
                wiek()
            case 2:
                kolo()
            case 3:
                szescian()
            default:
                continue
            }
        }
    }
}
