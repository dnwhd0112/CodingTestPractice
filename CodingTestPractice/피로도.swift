//
//  피로도.swift
//  CodingTestPractice
//
//  Created by 곽우종 on 2022/10/03.
//

import Foundation

func 피로도(_ k:Int, _ dungeons:[[Int]]) -> Int {
    let player = Player(currentTired: k, remainDungeons: dungeons, countDungeon: 0)
    player.searchDungeon()
    return Player.max
}

struct Player {
    static var max = 0
    var currentTired: Int
    var remainDungeons: [[Int]]
    var countDungeon: Int
    
    func searchDungeon() {
        for index in 0..<remainDungeons.count {
            if let requirTired = remainDungeons[index].first, let usingTired = remainDungeons[index].last, requirTired <= currentTired {
                var copyDungeons = remainDungeons
                copyDungeons.remove(at: index)
                
                let player = Player(currentTired: currentTired - usingTired, remainDungeons: copyDungeons, countDungeon: countDungeon + 1)
                player.searchDungeon()
            }
        }
        if Player.max < countDungeon {
            Player.max = countDungeon
        }
    }
}
