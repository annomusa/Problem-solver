//
//  200-number-of-islands.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 26/04/22.
//

import Foundation
import XCTest

private class Solution {
    
    typealias Idx = (row: Int, col: Int)
    private let neighborIdxs: [Idx] = [
        (row: -1, col: 0),
        (row: 0, col: 1),
        (row: 1, col: 0),
        (row: 0, col: -1)
    ]
    
    private let rowAdj = [-1,0,1,0] // top, right, bottom, left
    private let colAdj = [0,1,-1,0] // top, right, bottom, left
    
    func numIslands(_ grid: [[Character]]) -> Int {
        var res = 0
        
        var m = grid.count // row
        var n = grid[0].count // col
        var visited: [[Bool]] = Array(
            repeating: Array(repeating: false, count: n),
            count: m
        )
        
        for rowIdx in 0..<m {
            
            for colIdx in 0..<n {
                
                if visited[rowIdx][colIdx] {
                    continue
                }
                
                recurse(
                    isNew: true,
                    res: &res,
                    row: rowIdx,
                    col: colIdx,
                    grid: grid,
                    visited: &visited
                )
                
            }
            
        }
        
        return res
    }
    
    private func recurse(
        isNew: Bool,
        res: inout Int,
        row: Int,
        col: Int,
        grid: [[Character]],
        visited: inout [[Bool]]
    ) {
        guard row < grid.count, col < grid[0].count, row >= 0, col >= 0 else { return }
        
        guard grid[row][col] == "1", !visited[row][col] else {
            visited[row][col] = true
            return
        }
        
        visited[row][col] = true
        
        if isNew {
            res += 1
        }
        
        for neighborIdx in neighborIdxs {
            recurse(
                isNew: false,
                res: &res,
                row: row + neighborIdx.row,
                col: col + neighborIdx.col,
                grid: grid,
                visited: &visited
            )
        }
        
    }
}

class NumberOfIslandsTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        var grid1: [[Character]] = [
            ["1","1","1","1","0"],
            ["1","1","0","1","0"],
            ["1","1","0","0","0"],
            ["0","0","0","0","0"]
        ]
        XCTAssertEqual(sut.numIslands(grid1), 1)
        
        var grid2: [[Character]] = [
            ["1","1","0","0","0"],
            ["1","1","0","0","0"],
            ["0","0","1","0","0"],
            ["0","0","0","1","1"]
        ]
        XCTAssertEqual(sut.numIslands(grid2), 3)
    }
    
}
