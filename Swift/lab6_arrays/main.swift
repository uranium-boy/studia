import Foundation

func getPositiveInt(text: String) -> Int {
    while true {
        print(text, terminator: ": ")
        guard let input = Int(readLine()!), input > 0 else {
            print("Nieprawidlowa wartosc")
            continue
        }
        return input
    }
}

func getInt(text : String) -> Int {
    while true {
        print(text, terminator: ": ")
        guard let input = Int(readLine()!) else {
            print("Nieprawidlowa wartosc")
            continue
        }
        return input
    }
}

func getDouble(text : String) -> Double {
    while true {
        print(text, terminator: ": ")
        guard let input = Double(readLine()!) else {
            print("Nieprawidlowa wartosc")
            continue
        }
        return input
    }
}

func zad1() {
    let tab: [Double] = Array(repeating: 1.0, count: 12) // blad - typ Int zamiast Double
    for i in tab {
        print(i)
    }
}

func zad2() {
    var arr: [Int] = Array(repeating: 0, count: 10)
    arr.insert(getInt(text: "Element zerowy"), at: 0)

    let rnd = Int.random(in: 1..<10)
    arr.insert(getInt(text: "Element losowy"), at: rnd)

    print("Elementy tablicy:")
    for el in arr {
        print(el, terminator: ", ")
    }
    print("\n")
}

func zad3() {
    let len = getPositiveInt(text: "Podaj dlugosc tablicy")
    var arr: [Int] = []

    for i in 0 ..< len {
        arr.append(getInt(text: "Podaj \(i + 1). element"))
    }

    let num = getInt(text: "Podaj liczbe do sprawdzenia")
    if arr[0] == num {
        print("Podana liczba znajduje sie na pozycji pierwszej")
    }
    else if arr[len - 1] == num {
        print("Podana liczba znajduje sie na pozycji ostatniej")
    }
    else if arr.contains(num) {
        print("Podana liczba znajduje sie na innej pozycji")
    }
    else {
        print("Podanej liczby w ogole nie ma w tablicy")
    }
}

func zad4() {
    let len = getPositiveInt(text: "Podaj dlugosc tablicy")
    var arr1: [Int] = []
    var arr2: [Int] = []
//    var isEqual = true

    for i in 0 ..< len {
        arr1.append(getInt(text: "Podaj \(i + 1) element"))
    }
    for i in 0 ..< len {
        arr2.append(getInt(text: "Podaj \(i + 1) element"))
//        if arr1[i] != arr2[i] {
//            isEqual = false
//        }
    }

    let isEqual = arr1 == arr2
    if isEqual {
        print("Tablice sa takie same")
    } else {
        print("Tablice sa rozne")
    }
}

func zad5() {
    let len = getPositiveInt(text: "Podaj dlugosc tablicy")
    var arr: [Double] = []

    for i in 0 ..< len {
        arr.append(getDouble(text: "Podaj \(i + 1) element"))
    }

    arr.sort()

    print("Najmniejszy element tablicy: \(arr[0])")
    print("Najwiekszy element tablicy: \(arr[len - 1])")
}

func zad6() {
    let len = getPositiveInt(text: "Podaj dlugosc tablicy")
    var arr: [Int] = []
    var currentSubsequence: [Int] = []
    var longestSubsequence: [Int] = []

    for i in 0 ..< len {
        arr.append(getInt(text: "Podaj \(i) element"))

        if i == 0 || arr[i] > arr[i - 1] {
            currentSubsequence.append(arr[i])
        } else {
            if currentSubsequence.count > longestSubsequence.count {
                longestSubsequence = currentSubsequence
            }
            currentSubsequence = [arr[i]]
        }
    }

    if currentSubsequence.count > longestSubsequence.count {
        longestSubsequence = currentSubsequence
        currentSubsequence = []
    }

    if longestSubsequence.isEmpty {
        print("W tym ciagu nie ma podciagu rosnacego")
    }
    else if longestSubsequence.count == currentSubsequence.count {
        print("Znaleziono 2 podciagi o takiej samej dlugosc")
        print(longestSubsequence, currentSubsequence)
    } else {
        print("Najdluzszy podciag rosnacy: \(longestSubsequence)")
    }
}

func zad7() {
    let matrix: [[Int]] = [[10, 20, 30], [40, 50, 60]]
    for i in 0 ..< matrix.count {
        for j in 0 ..< matrix[i].count {
            print("\(matrix[i][j])", terminator: "\t")
        }
        print()
    }
}

func zad8() {
    let rows = getPositiveInt(text: "Podaj liczbe wierszy macierzy")
    let cols = getPositiveInt(text: "Podaj liczbe kolumn macierzy")

    var matrix: [[Int]] = []
    var largestRow: [Int] = []
    var currentSum: Int = 0
    var largestSum: Int = Int.min
    var rowNumber: Int = 0

    for i in 0 ..< rows {
        matrix.append([])
        for j in 0 ..< cols {
            let tmp = getInt(text: "Podaj element [\(i+1)][\(j+1)]")
            matrix[i].append(tmp)
            currentSum += tmp
        }
        if currentSum > largestSum {
            largestSum = currentSum
            largestRow = matrix[i]
            rowNumber = i + 1
        }
        currentSum = 0
    }

    if rowNumber == 0 {
        print("???")
        return
    }
    print("Wiersz \(rowNumber). ma najwiesza sume = \(largestSum)\n\(largestRow)")
}

let menu = """
1. Znajdz blad
2. Dodawanie elementow do tablicy
3. Sprawdzanie pozycji
4. Porownywanie tablic
5. Sortowanie
6. Znajdowanie podciagow
7. Deklarowanie macierzy
8. Wczytywanie danych do macierzy
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
        zad1();
    case 2:
        zad2()
    case 3:
        zad3()
    case 4:
        zad4()
    case 5:
        zad5()
    case 6:
        zad6()
    case 7:
        zad7()
    case 8:
        zad8()
    case 0:
        break menuloop
    default:
        print("Nieprawidlowa wartosc")
    }
}
