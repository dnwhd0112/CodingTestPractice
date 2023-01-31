//
//  평균값 구하기.swift
//  CodingTestPractice
//
//  Created by 곽우종 on 2022/12/07.
//

import Foundation

final class 평균값구하기 {
    func solution(_ arr:[Int]) -> Double {
        let sum = arr.reduce(0) { $0 + $1 }
        let result = Double(sum) / Double(arr.count)
        return result
    }
}
