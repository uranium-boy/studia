import Foundation

func printNumbers(start : Int, stop : Int, step : Int) {
    print("for-in")
    for i in stride(from: start, to: stop + 1, by: step) {
        print(i, terminator: " ")
    }
    print("\nwhile")
    var i = start
    while (i <= stop) {
        print(i, terminator: " ")
        i += step
    }

    print("\nrepeat-while")
    i = start
    repeat {
        print(i, terminator: " ")
        i += step
    } while i <= stop
    print("\n")
}

func getInt() -> Int {
    while true {
        print("Podaj liczbe:")
        guard let input = Int(readLine()!), input > 0 else {
            print("Nieprawidlowa wartosc")
            continue
        }
        return input
    }
}

func fibonacci() {
    let number = getInt()
    var n = 1
    var n_1 = 1
    var n_2 = 0
    print("Elementy ciagu:\n\(n_2)\n\(n_1)")

    while (n <= number) {
        print(n)
        n_2 = n_1
        n_1 = n
        n = n_2 + n_1
    }
}

func primeNumbers() {
    let number = getInt()

    if number <= 2 {
        print("Liczba jest pierwsza")
        return
    }

    for i in 2 ... Int(sqrt(Double(number))) {
        if (number % i == 0) {
            print("Liczba nie jest pierwsza")
            return
        }
    }
    print("Liczba jest pierwsza")
} 

func digitSum() {
    var number = 0
    while true {
        number = getInt()
        if number < 100 {
            print("Podana liczba musi miec co najmniej 3 cyfry")
            continue
        }
        break
    }

    var sum = 0
    var length = 0
    while number > 0 {
        length += 1
        sum += number % 10
        number /= 10
    }
    print("Suma cyfr: \(sum)\nSrednia arytmetyczna: \(Double(sum) / Double(length))")
}

func palindrom() {
    print("Wpisz ciag znakow")
    guard let str = (readLine()) else {
        print("?")
        return
    }

    if (str.count == 1) {
        print("Ciag jest palindromem, ig")
        return
    }

    for i in 1 ... Int(str.count) / 2 {
        let start = str[str.index(str.startIndex, offsetBy: i - 1)]
        let end = str[str.index(str.endIndex, offsetBy: -i)]
        if (start != end) {
            print("\(start) != \(end)")
            print("Wyraz nie jest palindromem")
            return
        }
        print("\(start) == \(end)")
    }
    print("Wyraz jest palindromem")
}

func blad() {
    var sum = 0
    var i = 0
    while i <= 7 {
        if i % 2 == 0 {
            i += 1          // <----- ta linijka
            continue
        }
        print(i)
        sum += i
        i += 1
    }
    print("Suma elementów wynosi \(sum)")
}

let menu = """
1. Liczby z krokiem 1
2. Liczby z krokiem 3
3. Fibonacci
4. Liczba pierwsza
5. Suma cyfr
6. Palindrom
7. Blad
0. Wyjscie
"""

menuloop: while true {
    print(menu)
    guard let number = Int(readLine()!) else {
        print("Nieprawidlowa wartosc")
        continue
    }

    switch number {
    case 1:
        printNumbers(start: 1, stop: 25, step: 1)
    case 2:
        printNumbers(start: 1, stop: 25, step: 3)
    case 3:
        fibonacci()
    case 4:
        primeNumbers()
    case 5:
        digitSum()
    case 6:
        palindrom()
    case 7:
        blad()
    case 0:
        break menuloop
    default:
        print("Nieprawidlowa wartosc")
    }
}