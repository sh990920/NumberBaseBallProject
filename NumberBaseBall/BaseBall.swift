//
//  BaseBall.swift
//  NumberBaseBall
//
//  Created by 박승환 on 6/11/24.
//

import Foundation

class BaseBall {
    let firstNumber: Int
    let secondNumber: Int
    let thirdNumber: Int
    
    var ball: Int = 0
    var strike: Int = 0
    
    init(firstNumber: Int, secondNumber: Int, thirdNumber: Int) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.thirdNumber = thirdNumber
    }
    
    func ballCount(_ input: [Int]) -> [Int] {
        let systemNumberArray = [firstNumber, secondNumber, thirdNumber]
        
        
        for (inputIdx, inputNum) in input.enumerated() {
            for (sysIdx, sysNum) in systemNumberArray.enumerated() {
                if inputNum == sysNum {
                    if inputIdx == sysIdx {
                        strike += 1
                        break
                    }
                    ball += 1
                    break
                }
            }
            
        }
        
        return [ball, strike]
    }
    
    func ballCountInit() {
        self.ball = 0
        self.strike = 0
    }
    
    func isEquals (_ system: Int, _ input: Int) -> Bool {
        if system == input {
            return true
        }
        return false
    }
}
