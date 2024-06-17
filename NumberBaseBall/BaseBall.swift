
import Foundation

class BaseBall {
    
    let firstNumber: Int
    
    let secondNumber: Int
    
    let thirdNumber: Int
    
    var ball: Int = 0
    var strike: Int = 0
    let systemNumberArray: [Int]
    
    init(firstNumber: Int, secondNumber: Int, thirdNumber: Int) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.thirdNumber = thirdNumber
        self.systemNumberArray = [firstNumber, secondNumber, thirdNumber]
    }
    
    func ballCount(_ input: [Int]) -> [Int] {
        for (inputIdx, inputNum) in input.enumerated() {
            equalsMethod(inputIdx, inputNum)
        }
        
        return [ball, strike]
    }
    
    func ballCountInit() {
        self.ball = 0
        self.strike = 0
    }
    
    func equalsMethod(_ inputIndex: Int, _ inputNumber: Int) {
        for (systemIndex, systemNumber) in systemNumberArray.enumerated() {
            if isEqualsNumber(systemNumber, inputNumber) && isEqualsIndex(systemIndex, inputIndex) {
                strike += 1;
                break
            } else if (isEqualsNumber(systemNumber, inputNumber)) {
                ball += 1;
                break;
            }
        }
    }
    
    func isEqualsNumber (_ systemNumber: Int, _ inputNumber: Int) -> Bool {
        if systemNumber == inputNumber {
            return true
        }
        return false
    }
    
    func isEqualsIndex(_ systemIndex: Int, _ inputIndex: Int) -> Bool {
        if systemIndex == inputIndex {
            return true
        }
        return false
    }
}
