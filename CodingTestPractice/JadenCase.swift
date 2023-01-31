//
//  JadenCase.swift
//  CodingTestPractice
//
//  Created by 곽우종 on 2023/01/31.
//

import Foundation

final class JadenCase {
    
    func solution(_ s:String) -> String {
        var lastIsEmpty = true
        
        let stringArray = Array(s)
        
        let result = stringArray.map { (word: Character) -> String in
            if word == " " {
                lastIsEmpty = true
                return " "
            } else if lastIsEmpty == true {
                let capitalWord = word.uppercased()
                lastIsEmpty = false
                return capitalWord
            } else {
                return String(word).lowercased()
            }
        }
        
        let resultString = result.reduce("") {
            return $0 + $1
        }
        
        return resultString
    }
}
