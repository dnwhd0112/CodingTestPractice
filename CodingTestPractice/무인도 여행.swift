//
//  무인도 여행.swift
//  CodingTestPractice
//
//  Created by 우롱차 on 2023/01/31.
//

import Foundation

final class 무인도여행 {
    
    var arrayMap: [[Character]] = []
    var countMap: [[Int]] = []
    var maxRow = 0
    var maxIndex = 0
    
    func solution(_ maps:[String]) -> [Int] {
        
        var resultArray: [Int] = []
        
        arrayMap = maps.map { (singleMap: String) -> [Character] in
            return Array(singleMap)
        }
        maxRow = arrayMap.count - 1
        maxIndex = (arrayMap.first?.count ?? 0) - 1
        
        countMap = Array(repeating: Array(repeating: -1, count: arrayMap.first?.count ?? 0), count: arrayMap.count)
        
        var row = 0
        while (row <= maxRow) {
            var index = 0
            while (index <= maxIndex) {
                let count = sumMap(row: row, index: index)
                if count != 0 {
                    resultArray.append(count)
                }
                index += 1
            }
            row += 1
        }
        
        if resultArray.count == 0 {
            resultArray.append(-1)
        }
        
        return resultArray.sorted()
    }
    
    func sumMap(row: Int, index: Int) -> Int {
        
        guard row >= 0, index >= 0, row <= maxRow, index <= maxIndex else {
            return 0
        }
        
        if countMap[row][index] == -1 {
            if let island = Int(String(arrayMap[row][index])) {
                countMap[row][index] = island
                var result = island
                result += sumMap(row: row - 1, index: index)
                result += sumMap(row: row + 1, index: index)
                result += sumMap(row: row, index: index - 1)
                result += sumMap(row: row, index: index + 1)
                return result
            } else {
                countMap[row][index] = 0
                return 0
            }
        }
        else {
            return 0
        }
    }
}
