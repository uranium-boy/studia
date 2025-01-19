import Foundation

protocol ComplexNumber {
    var Re: Int { get set }
    var Im: Int { get set }
}

protocol Operations {
    func add(re: Int, im: Int) -> (re: Int, im: Int)
    func subtruct(re: Int, im: Int) -> (re: Int, im: Int)
    func show()
}

class OperationOnComplexNumbers : ComplexNumber, Operations {
    var Re: Int
    var Im: Int

    init(re: Int, im: Int) {
        self.Re = re
        self.Im = im
    }

    func add(re: Int, im: Int) -> (re: Int, im: Int) {
        return (Re + re, Im + im)
    }
    func subtruct(re: Int, im: Int) -> (re: Int, im: Int) {
        return (Re - re, Im - im)
    }
    func show() {
        var sign: Character
        if Im < 0 {
            sign = "-"
        } else {
            sign = "+"
        }
        print(Re, sign, abs(Im), "i")
    }
}

enum ATMerrors: Error {
    case insufficientFunds
    case notEnoughCash
    case wrongAmount
}

let onAccount = 8000
let inMachine = 3000


func atm_controller(amount: Int) {

    do {
        guard amount <= onAccount else {
            throw ATMerrors.insufficientFunds
        }
        guard amount <= inMachine else {
            throw ATMerrors.notEnoughCash
        }
        guard amount % 10 == 0 && amount >= 0 else {
            throw ATMerrors.wrongAmount
        }
        print("Withdrawn: \(amount)")
    } catch ATMerrors.insufficientFunds {
        print("Not enough funds on your account")
    } catch ATMerrors.notEnoughCash {
        print("Not enough cash in the ATM")
    } catch ATMerrors.wrongAmount {
        print("Wrong amount to be withdrawn")
    } catch {
        print("Other error")
    }
}

let obj1 = OperationOnComplexNumbers(re: 1, im: -5)
var (re, im) = obj1.add(re: 2, im: 3)
print(re, im)
obj1.show()

atm_controller(amount: 50)
atm_controller(amount: 50000)
atm_controller(amount: 7000)
atm_controller(amount: 5)
