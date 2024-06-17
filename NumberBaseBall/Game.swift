
import Foundation

class Game {
    var baseBall: BaseBall
    var input:[Int] = []
    var gameLog: [Int] = []
    
    init() {
        self.baseBall = BaseBall(firstNumber: 0, secondNumber: 0, thirdNumber: 0)
    }
    
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
        case GameMenu.gameStart.rawValue:
            playGame()
        case GameMenu.gameResult.rawValue:
            showGameLog()
        case GameMenu.gameEnd.rawValue:
            print("< 숫자 야구 게임을 종료합니다 >")
            return false
        default:
            print("올바른 숫자를 입력해주세요!")
            print()
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
            baseBall.ballCountInit()
            print("숫자를 입력하세요 : ", terminator: "")
            let input = readLine()!
            if !inputNumber(input) {
                print("올바르지 않은 입력값입니다")
                print()
                continue
            }
            gameCount += 1
            print(input)
            let ballCount = baseBall.ballCount(self.input)
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
    
    func isNumber(_ str: String) -> Bool {
        if Int(str) != nil && str.count == 3 {
            return true
        } else {
            return false
        }
    }
    
    func isEquals(_ arr:[Int]) -> Bool {
        let setArr = Set(arr)
        if setArr.count == arr.count {
            return false
        }
        return true
    }
    
}
