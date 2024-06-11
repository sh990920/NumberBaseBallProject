//
//  Game.swift
//  NumberBaseBall
//
//  Created by 박승환 on 6/11/24.
//

import Foundation

class Game {
    var baseBall: BaseBall
    var input:[Int] = []
    
    init() {
        self.baseBall = BaseBall(firstNumber: 0, secondNumber: 0, thirdNumber: 0)
    }
    
    func gameSetting() {
        var firstNumber = createRandomNumber()
        var secondNumber = createRandomNumber()
        var thirdNumber = createRandomNumber()
        
        while (firstNumber == secondNumber || firstNumber == thirdNumber || secondNumber == thirdNumber) {
            firstNumber = createRandomNumber()
            secondNumber = createRandomNumber()
            thirdNumber = createRandomNumber()
        }
        
        baseBall = BaseBall(firstNumber: firstNumber, secondNumber: secondNumber, thirdNumber: thirdNumber)
    }
    
    private func createRandomNumber() -> Int {
        let number = Int.random(in: 1...9)
        return number
    }
    
    func playGame() {
        gameSetting()
//        print(baseBall.firstNumber)
//        print(baseBall.secondNumber)
//        print(baseBall.thirdNumber)
        print("< 게임을 시작합니다 >")
        while(isCorrect()) {
            // 볼카운트 초기화
            baseBall.ballCountInit()
            // 숫자 입력
            print("숫자를 입력하세요 : ", terminator: "")
            let input = readLine()!
            // 입력값이 이상하면 다시 입력
            if !inputNumber(input) {
                print("올바르지 않은 입력값입니다")
                continue
            }
            print(input)
            // 계산 결과 받기
            let ballCount = baseBall.ballCount(self.input)
            // 출력
            ballCountPrint(ballCount)
        }
        print("< 게임 종료 >")
    }
    
    func ballCountPrint(_ ballCount: [Int]) {
        if ballCount[0] == 0 && ballCount[1] == 0 {
            print("Nothing")
        } else {
            if ballCount[1] == 3 {
                print("정답입니다!")
                return
            }
            if ballCount[1] != 0 {
                print("\(ballCount[1]) 스트라이크", terminator: " ")
            }
            if ballCount[0] != 0 {
                print("\(ballCount[0]) 볼")
            }
        }
        print()
    }
    
    func isCorrect() -> Bool {
        if baseBall.strike == 3 {
            return false
        }
        return true
    }
    
    // 숫자 입력
    func inputNumber(_ input: String) -> Bool {
        var numList: [Int] = []
        if isNumber(input) {
            numList = input.map { Int(String($0))! }
            if !isEquals(numList) {
                self.input = numList
                return true
            }
        }
        return false
    }
    
    // 숫자인지 확인하는 메소드
    func isNumber(_ str: String) -> Bool {
        if str.count != 3 {
            return false
        }
        if let number = Int(str) {
            return true
        } else {
            return false
        }
    }
    
    // 입력값이 같은지 확인하는 메소드
    func isEquals(_ arr:[Int]) -> Bool {
        var setArr = Set(arr)
        if setArr.count == arr.count {
            return false
        }
        return true
    }
    
}
