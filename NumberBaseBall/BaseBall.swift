//
//  BaseBall.swift
//  NumberBaseBall
//
//  Created by 박승환 on 6/11/24.
//

import Foundation

class BaseBall {
    // 첫번째 숫자
    let firstNumber: Int
    // 두번째 숫자
    let secondNumber: Int
    // 세번째 숫자
    let thirdNumber: Int
    // 볼카운트를 계산할 변수
    var ball: Int = 0
    var strike: Int = 0
    // 숫자들을 가지고 있는 배열
    let systemNumberArray: [Int]
    
    // 셍성자
    init(firstNumber: Int, secondNumber: Int, thirdNumber: Int) {
        self.firstNumber = firstNumber
        self.secondNumber = secondNumber
        self.thirdNumber = thirdNumber
        self.systemNumberArray = [firstNumber, secondNumber, thirdNumber]
    }
    
    // 볼카운트 계산 메소드
    func ballCount(_ input: [Int]) -> [Int] {
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
    
    // 볼카운트 초기화 메소드
    func ballCountInit() {
        self.ball = 0
        self.strike = 0
    }
    
    // 반복문 depth를 줄이기 위한 함수
    func equalsMethod(_ inputIndex: Int, _ inputNumber: Int) {
        for (systemIndex, systemNumber) in systemNumberArray.enumerated() {
            if isEqualsNumber(systemNumber, inputNumber) {
                if isEqualsIndex(systemIndex, inputIndex) {
                    strike += 1
                    break
                }
                ball += 1
                break
            }
        }
    }
    
    // 숫자가 같은지 확인할 메소드
    func isEqualsNumber (_ systemNumber: Int, _ inputNumber: Int) -> Bool {
        if systemNumber == inputNumber {
            return true
        }
        return false
    }
    
    // 인덱스가 같은지 확인할 메소드
    func isEqualsIndex(_ systemIndex: Int, _ inputIndex: Int) -> Bool {
        if systemIndex == inputIndex {
            return true
        }
        return false
    }
}
