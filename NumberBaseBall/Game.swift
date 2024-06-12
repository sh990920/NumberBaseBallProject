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
    var gameLog: [Int] = []
    
    init() {
        self.baseBall = BaseBall(firstNumber: 0, secondNumber: 0, thirdNumber: 0)
    }
    // Lv3 첫번 째 자리 숫자는 0이 될 수 없음
    func gameSetting() {
        var firstNumber = createRandomNumber()
        var secondNumber = createRandomNumber()
        var thirdNumber = createRandomNumber()
        
        while (firstNumber == 0 || firstNumber == secondNumber || firstNumber == thirdNumber || secondNumber == thirdNumber) {
            firstNumber = createRandomNumber()
            secondNumber = createRandomNumber()
            thirdNumber = createRandomNumber()
        }
        
        baseBall = BaseBall(firstNumber: firstNumber, secondNumber: secondNumber, thirdNumber: thirdNumber)
    }
    // Lv3 0 ~ 9 까지 숫자 중 아무거나 선택되도록 수정
    private func createRandomNumber() -> Int {
        let number = Int.random(in: 0...9)
        return number
    }
    
    func startGame() {
        var isPlay = true
        print("환영합니다! 원하시는 번호를 입력해주세요")
        
        while isPlay {
            print("1. 게임 시작하기  2. 게임 기록 보기  3. 종료하기")
            print("메뉴를 선택해주세요 : ", terminator: "")
            let menuSelect = readLine()!
            if let menuSelectNumber = Int(menuSelect) {
                isPlay = selectMenu(menuSelectNumber)
            } else {
                print("올바른 숫자를 입력해주세요!")
                print()
            }
        }
        
    }
    
    func selectMenu(_ selectNumber: Int) -> Bool {
        switch selectNumber {
        case 1:
            playGame()
        case 2:
            // 아직 기능 없음
            showGameLog()
        case 3:
            print("< 숫자 야구 게임을 종료합니다 >")
            return false
        default:
            break
        }
        return true
    }
    
    func showGameLog() {
        print("< 게임 기록 보기 >")
        if gameLog.isEmpty {
            print("게임 기록 결과가 없습니다.")
        } else {
            for (idx, log) in gameLog.enumerated() {
                print("\(idx + 1)번째 게임 : 시도 횟수 - \(log)회")
            }
        }
        print()
    }
    
    func playGame() {
        var gameCount = 0
        gameSetting()
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
                print()
                continue
            }
            gameCount += 1
            print(input)
            // 계산 결과 받기
            let ballCount = baseBall.ballCount(self.input)
            // 출력
            ballCountPrint(ballCount)
        }
        print("< 게임 종료 >")
        print()
        gameLog.append(gameCount)
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
            } else {
                print()
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
        if Int(str) != nil {
            return true
        } else {
            return false
        }
    }
    
    // 입력값이 같은지 확인하는 메소드
    func isEquals(_ arr:[Int]) -> Bool {
        let setArr = Set(arr)
        if setArr.count == arr.count {
            return false
        }
        return true
    }
    
}
