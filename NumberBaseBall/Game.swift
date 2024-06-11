//
//  Game.swift
//  NumberBaseBall
//
//  Created by 박승환 on 6/11/24.
//

import Foundation

class Game {
    var baseBall: BaseBall
    
    init() {
        self.baseBall = BaseBall(firstNumber: 0, secodeNumber: 0, thirdNumber: 0)
    }
    
    func gameSetting() {
        let firstNumber = createRandomNumber()
        let secodeNumber = createRandomNumber()
        let thirdNumber = createRandomNumber()
        
        baseBall = BaseBall(firstNumber: firstNumber, secodeNumber: secodeNumber, thirdNumber: thirdNumber)
    }
    
    private func createRandomNumber() -> Int {
        let number = Int.random(in: 0...9)
        return number
    }
    
}
