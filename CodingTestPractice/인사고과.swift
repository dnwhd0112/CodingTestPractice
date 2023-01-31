//
//  인사고과.swift
//  CodingTestPractice
//
//  Created by 우롱차 on 2023/02/01.
//
// test input :

import Foundation

final class 인사고과 {
    func solution(_ scores:[[Int]]) -> Int {
        var tempScores = scores
        let score = tempScores.removeFirst()
        let scoreSum = score[0] + score[1]
        var result = 1
        var isMunus = false
        var maxSecond = 0
        var maxFirst = 0
        
        if tempScores.isEmpty {
            return 1
        }
        
        tempScores.sort { scoreA, scoreB in
            if scoreA[0] > scoreB[0] {
                return true
            }
            return false
        }
        
        maxSecond = tempScores[0][1]
        maxFirst = tempScores[0][0]
        
        tempScores.forEach { compareScore in
            if compareScore[0] > score[0],
               compareScore[1] > score[1] {
                isMunus = true
                return
            }
            
            if compareScore[0] >= maxFirst || compareScore[1] >= maxSecond {
                maxSecond = compareScore[1]
                let compareSum = compareScore[0] + compareScore[1]
                if compareSum > scoreSum {
                    result += 1
                }
            }
        }
        if isMunus == true {
            return -1
        }
        return result
    }
}
