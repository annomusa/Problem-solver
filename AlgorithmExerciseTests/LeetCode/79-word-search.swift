//
//  79-word-search.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 14/04/22.
//

import Foundation
import XCTest

private class Solution {
    
    var board: [[Character]] = []
    var ROWS = 0
    var COLS = 0
    
    func exist(_ board: [[Character]], _ word: String) -> Bool {
        self.board = board
        self.ROWS = board.count
        self.COLS = board[0].count
        
        for i in 0..<ROWS {
            for j in 0..<COLS {
                if backtrack(row: i, col: j, word: word, idx: 0) {
                    return true
                }
            }
        }
        
        return false
    }
    
    private func backtrack(row: Int, col: Int, word: String, idx: Int) -> Bool {
        
        guard idx < word.count else { return false }
        
        if row < 0 || row >= self.ROWS || col < 0 || col >= self.COLS || self.board[row][col] != word[word.index(word.startIndex, offsetBy: idx)] {
            return false
        }
        board[row][col] = Character("#")
        var res = false
        let rowOffsets = [0, 1, 0, -1]
        let colOffsets = [1, 0, -1, 0]
        for d in 0..<4 {
            res = backtrack(row: row + rowOffsets[d], col: col + colOffsets[d], word: word, idx: idx + 1)
            if res {
                break
            }
        }
        
        board[row][col] = word[word.index(word.startIndex, offsetBy: idx)]
        return res
    }
}

class WordSearchTests: XCTestCase {
    
    func test1() {
        
        
        
    }
    
}
