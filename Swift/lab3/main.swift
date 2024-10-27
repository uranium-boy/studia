import Foundation


func user_input() -> Int{
    while(true){
        print(" >> ", terminator: "")
        if let input = Int(readLine()!){
            return input
        }
        else{
            print("Wrong value, try again")
        }
    }
}

func user_input() -> Float{
    while(true){
        print(" >> ", terminator: "")
        if let input = Float(readLine()!){
            return input
        }
        else{
            print("Wrong value, try again")
        }
    }
}

func dec_to_rom(dec: Int) -> String{
    // made with love and Chat GPT :3
    let romanValues = [
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
    
    var result = ""
    var remaining = dec
    
    for (value, symbol) in romanValues {
        while remaining >= value {
            result += symbol
            remaining -= value
        }
    }
    return result
}

func post_code() -> String{
    var code: String = ""
    while(true){
        print("Post Code >> ", terminator: "")
        code = readLine() ?? ""
        
        // check post code using regex
        let range = NSRange(location: 0, length: code.utf16.count)
        let regex: NSRegularExpression = try! NSRegularExpression(pattern: "\\d{2}-\\d{3}")
                
        if(regex.firstMatch(in: code, options: [], range: range) != nil){
            return code // FUNNY NUMBER!!
        }
    }
    return ":3"
}

func extract_post_code(code: String) -> Int{
    return Int(code.prefix(2))!
}

func get_char() -> String{
    while(true){
        print("Character >> ", terminator: "")
        if let char = readLine(), char.count == 1 {
            return char
        }
        else{
            print("Wrong value, try again")
        }   
    }
}

func get_pesel() -> String{
    while(true){
        print("PESEL >> ", terminator: "")
        if let pesel = readLine(), pesel.count == 11 {
            return pesel
        }
        else{
            print("Wrong value, try again")
        }
    }
}

func main(){
    var input: Int = 1
    while(input > 0){
        
        print("Choose program to run (1 - 7)", terminator: "")
        input = user_input()

        switch (input){
            case 1:
                exercise_1()
                break
            case 2:
                exercise_2()
                break
            case 3:
                exercise_3()
                break
            case 4:
                exercise_4()
                break
            case 5:
                exercise_5()
                break
            case 6:
                exercise_6()
                break
            case 7:
                exercise_7()
                break            
            default: 
                print("Wrong value, exiting")
                input = -1
                break
        }
    }
}


// DONE!
func exercise_1(){
    // year cannot be a negative value
    var year: Int = -1
    while(year < 0){
        print("Year ", terminator: "")
        year = user_input()
    }
    // check if leap year
    if((year % 4 == 0 && year % 100 != 0) || (year % 400 == 0)){
        print("leap-year")   
    }
    else{
        print("not a leap year")
    }
}

// DONE!
func exercise_2(){
    // year input <2; 3010>
    var year: Int = -1
    while(year < 2 || year > 3010){
        print("Year ", terminator: "")
        year = user_input()
    }

    // calculate century
    let temp = Float(year) / 100.0
    var century = year / 100
    if(temp > (Float)(century)){
        century += 1
    }

    // roman value
    let roman = dec_to_rom(dec: century)

    // output
    print(String(format: "Year %d, century %@ (%d)", year, roman, century))
}

// DONE!
func exercise_3(){
    // grade input
    var grade: Float = 0
    while(grade < 2 || grade > 5 || Int(grade*10) % 5 != 0){
        print("Grade", terminator: "")
        grade = user_input()
    }

    // switch case for tution
    var tution = 0
    switch (grade){
        case 2.0 ..< 3.0:
            tution = 0
            break
        case 3.0 ..< 4.0:
            tution = 100
            break
        case 4.0 ..< 4.5:
            tution = 150
            break
        case 4.5 ... 5.0:
            tution = 200
            break
        default:
            print("Uhh something ain't right")
            break
    }

    // output
    print(String(format:"Grade %.2f tution %d", grade, tution))
}

// DONE!
func exercise_4(){
    // arguments
    print("Value A", terminator: "")
    let a: Int = user_input()
    print("Value B", terminator: "")
    let b: Int = user_input()

    // task to perform
    var task = 0
    while(task < 1 || task > 4){
        print("1-dodawanie, 2-odejmowanie, 3-mnożenie, 4-dzielenie")
        task = user_input()
    }

    // execute task
    var value: Float = 0
    var op = "?"
    switch (task){
        case 1:
            value = Float(a + b)
            op = "+"
            break
        case 2:
            value = Float(a - b)
            op = "-"
            break
        case 3:
            value = Float(a * b)
            op = "*"
            break
        case 4:
            if(b == 0){
                print("Can't divide by 0")
            }
            else{
                value = Float(a) / Float(b)
                op = "/"
            }
            break
        default:
            print("Uhh something ain't right")
            break
    }

    // output
    if(op != "?"){
        print(String(format:"%d %@ %d = %.3f", a, op, b, value))
    }
}

// DONE!
func exercise_5(){
    // input post code
    let code = extract_post_code(code: post_code())
    // *pain*
    switch (code){
        case 50 ... 59:
            print("Dolnośląskie")
            break
        case 85 ... 89:
            print("Kujawsko-Pomorskie")
            break
        case 20 ... 24:
            print("Lubelskie")
            break
        case 65 ... 69:
            print("Lubuskie")
            break
        case 90 ... 99:
            print("Łódzkie")
            break
        case 30 ... 34:
            print("Małopolskie")
            break
        case 0 ... 9:
            print("Mazowieckie")
            break
        case 45 ... 49:
            print("Opolskie")
            break
        case 35 ... 39:
            print("Podkarpackie")
            break
        case 15 ... 19:
            print("Podlaskie")
            break
        case 80 ... 84:
            print("Pomorskie")
            break
        case 40 ... 44:
            print("Śląskie")
            break
        case 25 ... 29:
            print("Świętokrzyskie")
            break
        case 10 ... 14:
            print("Warmińsko-Mazurskie")
            break
        case 60 ... 64:
            print("Wielkopolskie")
            break
        case 70 ... 78:
            print("Zachodniopomorskie")
            break
        default:
            print("<3")
            break
    }
}

// DONE
func exercise_6(){
    // input char (it's not a char lol)
    let char = get_char()

    switch (char){
        case "e", "y", "u", "i", "o", "a":
            print("Vowel")
            break
        case "q", "w", "r", "t", "p", "s", "d", "f", "g", "h", "j", "k", "l", "z", "x", "c", "v", "b", "n", "m":
            print("Constant")
            break
        case "1", "2", "3", "4", "5", "6", "7", "8", "9", "0":
            print("Digit")
            break
        default:
            print("Special character")
            break             
    }
}


// DONE
func exercise_7(){
    // input pesel
    let pesel = get_pesel()
    // check gender
    switch (pesel.suffix(2).prefix(1)){
        case "1", "3", "5", "7", "9":
            print("Male")
            break
        case "0", "2", "4", "6", "8":
            print("Female")
            break
        default:
            print(":V")
            break
    }
}


main()