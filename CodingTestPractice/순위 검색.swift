//
//  순위 검색.swift
//  CodingTestPractice
//
//  Created by 곽우종 on 2022/09/29.
//

//테스트 실행코드
//let test1 = 순위검색()
//
//let info = ["java backend junior pizza 150","python frontend senior chicken 210","python frontend senior chicken 150","cpp backend senior pizza 260","java backend junior chicken 80","python backend senior chicken 50"]
//let query = ["cpp and - and senior and pizza 250","- and backend and senior and - 150","- and - and - and chicken 100","- and - and - and - 150"]
//
//print(test1.solution(info, query))


import Foundation

final class 순위검색 {
    func solution(_ info:[String], _ query:[String]) -> [Int] {
        
        var saveInfo = Dictionary<Person,[Int]>()
        
        for oneInfo in info {
            let splitArray = oneInfo.components(separatedBy: " ")
            if let langague = Langague(rawValue: splitArray[0]),
                  let work = Work(rawValue: splitArray[1]),
                  let exprience = Exprience(rawValue: splitArray[2]),
                  let soulFood = SoulFood(rawValue: splitArray[3]),
                  let score = Int(splitArray[4]) {
                let person = Person(langague: langague, work: work, exprience: exprience, soulFood: soulFood)
                if let exesitValue = saveInfo[person] {
                    var newValue = exesitValue
                    newValue.append(score)
                    saveInfo.updateValue(newValue, forKey: person)
                } else {
                    saveInfo.updateValue([score], forKey: person)
                }
            }
        }
        
        let queryArray = query.compactMap({(oneQuery: String) -> Int in
            let splitQuery = oneQuery.components(separatedBy: " ")
            guard splitQuery.count == 8 else {
                return 0
            }
            let langague = Langague(rawValue: splitQuery[0])
            let work = Work(rawValue: splitQuery[2])
            let exprience = Exprience(rawValue: splitQuery[4])
            let soulFood = SoulFood(rawValue: splitQuery[6])
            guard let score = Int(splitQuery[7]) else {
                return 0
            }
            let query = Query(langague: langague, work: work, exprience: exprience, soulFood: soulFood, score: score)
            return count(query: query, dict: saveInfo)
        })
        return queryArray
    }
}


enum Langague: String {
    case java
    case python
    case cpp
    case all
}

enum Work: String {
    case backend
    case frontend
    case all
}

enum Exprience: String {
    case junior
    case senior
    case all
}

enum SoulFood: String {
    case chicken
    case pizza
    case all
}

struct Person: Hashable {
    let langague: Langague
    let work: Work
    let exprience: Exprience
    let soulFood: SoulFood
}

struct Query {
    let langague: Langague?
    let work: Work?
    let exprience: Exprience?
    let soulFood: SoulFood?
    let score: Int
}

func count(query: Query, dict: Dictionary<Person,[Int]>) -> Int {
    guard let langague = query.langague else {
        let countCpp = count(query: Query(langague: Langague.cpp, work: query.work, exprience: query.exprience, soulFood: query.soulFood, score: query.score), dict: dict)
        let countJava = count(query: Query(langague: Langague.java, work: query.work, exprience: query.exprience, soulFood: query.soulFood, score: query.score), dict: dict)
        let countPython = count(query: Query(langague: Langague.python, work: query.work, exprience: query.exprience, soulFood: query.soulFood, score: query.score), dict: dict)
        return countCpp + countJava + countPython
    }
    
    guard let work = query.work else {
        let countBack = count(query: Query(langague: langague, work: Work.backend, exprience: query.exprience, soulFood: query.soulFood, score: query.score), dict: dict)
        let countFront = count(query: Query(langague: langague, work: Work.frontend, exprience: query.exprience, soulFood: query.soulFood, score: query.score), dict: dict)
        return countBack + countFront
    }
    
    guard let exprience = query.exprience else {
        let countJunior = count(query: Query(langague: langague, work: work, exprience: Exprience.junior, soulFood: query.soulFood, score: query.score), dict: dict)
        let countSenior = count(query: Query(langague: langague, work: work, exprience: Exprience.senior, soulFood: query.soulFood, score: query.score), dict: dict)
        return countJunior + countSenior
    }
    
    guard let soulFood = query.soulFood else {
        let countChicken = count(query: Query(langague: langague, work: work, exprience: exprience, soulFood: SoulFood.chicken, score: query.score), dict: dict)
        let countPizza = count(query: Query(langague: langague, work: work, exprience: exprience, soulFood: SoulFood.pizza, score: query.score), dict: dict)
        return countChicken + countPizza
    }
    
    let person = Person(langague: langague, work: work, exprience: exprience, soulFood: soulFood)
    if let scoreArray = dict[person] {
        return scoreArray.filter{$0 >= query.score}.count
    } else {
        return 0
    }
}
