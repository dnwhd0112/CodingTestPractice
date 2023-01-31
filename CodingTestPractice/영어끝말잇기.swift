//
//  영어끝말잇기.swift
//  CodingTestPractice
//
//  Created by 곽우종 on 2022/09/29.
//

// 테스트 실행코드
//let test = 영어끝말잇기()
//
//let testArray = ["tank", "kick", "know", "wheel", "land", "dream", "mother", "robot", "tank"]
//
////print(test.solution(3, testArray) == [3,3])


import Foundation

final class 영어끝말잇기 {
    
    //통과시 true 반환
    func checkDuplicate(word: String, list: inout Set<String>) -> Bool {
        if list.contains(word) {
            return false
        }
        list.insert(word)
        return true
    }
    
    func checkWord(before: String, now: String) -> Bool {
        guard before != "" else {
            return true
        }
        
        guard let beforeLast = before.last, let nowFirst = now.first else {
            return false
        }
        
        if beforeLast != nowFirst {
            return false
        }
        
        return true
    }
    
    func solution(_ n:Int, _ words:[String]) -> [Int] {
        var count = 0
        var lastWord = ""
        var worldList = Set<String>()
        
        for word in words {
            if checkDuplicate(word: word, list: &worldList) && checkWord(before: lastWord, now: word){
                count += 1
                lastWord = word
            } else {
                let personNumber = 1 + count % n
                let personRound = 1 + count / n
                return [personNumber, personRound]
            }
        }
        return [0,0]
    }
}
