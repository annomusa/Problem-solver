//
//  TournamentWinner.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 02/04/22.
//

import Foundation
import XCTest

private class Program {
    let HOME_TEAM_WON = 1
    
    func tournamentWinner(_ competitions: [[String]], _ results: [Int]) -> String {
        
        var map: [String: Int] = [:]
        
        for competition in competitions.enumerated() {
            
            let winnerIndex = results[competition.offset] == 1 ? 0 : 1
            
            let winner = competition.element[winnerIndex]
            map[winner, default: 0] += 3
            
        }
        
        let tournamentWinner = map.sorted { v1, v2 in
            v1.value > v2.value
        }.first
        
        return tournamentWinner!.key
    }
}

class TournamentWinner: XCTestCase {
    
    func test1() {
        
        let sut = Program()
        
        let res = sut.tournamentWinner(
            [
                ["HTML", "C#"],
                ["C#", "Python"],
                ["Python", "HTML"]
            ],
            [0,0,1]
        )
        
    }
    
}
