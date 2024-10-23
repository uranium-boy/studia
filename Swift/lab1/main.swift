import Foundation

func age()
{
    let currentYear = 2024

    while true {
        print("Enter the year of your birth: ")
        if let input = readLine(), let birthYear = Int(input), birthYear >= 1900 && birthYear <= currentYear {
            print("Your age is \(currentYear - birthYear)")
            break;
        }
        else {
            print("Incorrect value, please try again.")
        }
    }
}

func circle() {
    let PI = 3.1415
    var radius: Double

    while true {
        print("Enter radius: ")
        if let input = readLine(), let checked = Double(input), checked > 0 {
            radius = checked
        } else {
            print("Incorrect value, please try again.")
            continue
        }

        print(String(format: """
                    Radius: %.2f
                    Area: %.2f
                    Circumference: %.2f
                    """, radius, 2 * PI * radius, PI * radius * radius))
        break
    }
}

func cube()
{
    var side : Double

    while true {
        print("Enter the cube side length: ")
        if let input = readLine(), let number = Double(input), number > 0 {
            side = number
        }
        else {
            print("Incorrect value, try again.")
            continue
        }

        print(String(format: """
            Area: %.2f
            Volume: %.2f
            """, 6 * side * side, side * side * side))
        break;
    }
}

func floor()
{
    func getDouble() -> Double {
        while true {
            if let input = readLine(), let number = Double(input), number > 0 {
                return number
            }
            else {
                print("Incorrect value, please try again.")
            }
        }
    }
    var a, b, z, price : Double

    print("Enter price: ")
    price = getDouble()
    print("Enter dimension `a`: ")
    a = getDouble()
    print("Enter dimension `b`: ")
    b = getDouble()
    print("Enter dimension `z`: ")
    z = getDouble()

    let footage = a * b + b * z
    print(String(format:"Total footage: %.2f\nPrice: %.2f", footage, price * footage))
}

func arithmeticMean()
{
    let len = 3
    var mean = 0.0

    for _ in 0..<len {
        let randomInt = Int.random(in: 1...9)
        print("Random number: \(randomInt)")
        mean += Double(randomInt)
    }
    print(String(format: "Arithmetic mean: %.2f", mean / Double(len)))
}

func weightedMean()
{
    var totalWeight = 0
    var gradesSum = 0.0
    var tempGrade : Double
    let len = 3

    for _ in 0..<len {
        while true {
            print("Enter grade: ")
            if let input = readLine(), let grade = Double(input), grade >= 2 && grade <= 5 {
                tempGrade = grade
            } else {
                print("Incorrect value")
                continue
            }
            print("Enter weight: ")
            if let input = readLine(), let weight = Int(input), weight >= 1 && weight <= 3 {
                totalWeight += weight
                gradesSum += tempGrade * Double(weight)
            } else {
                print("Incorrect value")
                continue
            }
            break
        }
    }

    print(String(format: "Weighted mean: %.2f", gradesSum / Double(totalWeight)))
}

let menu = """
    Lab 2:
    1. Age
    2. Circle
    3. Cube
    4. Floor
    5. Arithmetic mean
    6. Weighted mean
    0. Exit
    """

var input: Int = 1

menuloop: while true {
    print(menu)

    if let userInput = readLine(), let number = Int(userInput), number >= 0 {
        input = number
    }
    else {
        print("Incorrect value, please try again.")
        continue
    }

    switch input {
        case 0:
            break menuloop
        case 1:
            age()
        case 2:
            circle()
        case 3:
            cube()
        case 4:
            floor()
        case 5:
            arithmeticMean()
        case 6:
            weightedMean()
        default:
            continue
    }
}

while true {
}
