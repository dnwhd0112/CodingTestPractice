//
//  자릿수 더하기.swift
//  CodingTestPractice
//
//  Created by 곽우종 on 2022/12/07.
//

import Foundation

final class 자릿수더하기 {
    func solution(_ n:Int) -> Int
    {
        
        var temp = n
        var answer:Int = 0
        
        while(temp > 0) {
            answer += temp % 10
            temp = temp / 10
        }
        
        return answer
    }
}
