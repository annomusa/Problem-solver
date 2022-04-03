//
//  RiverSize.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 30/03/22.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

private class Program {
    func riverSizes(_ matrix: [[Int]]) -> [Int] {
        guard !matrix.isEmpty, !matrix[0].isEmpty else { return [] }
        
        let height = matrix.count
        let width = matrix[0].count
        
        var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
        var result: [Int] = []
        
        for row in matrix.enumerated() {
            
            for col in row.element.enumerated() {
                
                guard !visited[row.offset][col.offset] else { continue }
                
                check(
                    row: row.offset,
                    col: col.offset,
                    matrix: matrix,
                    visited: &visited,
                    result: &result
                )
            }
            
        }
        
        return result
    }
    
    private func check(row: Int, col: Int, matrix: [[Int]], visited: inout [[Bool]], result: inout [Int]) {
        var currentRiverSize = 0
        var nodeToExplore: [[Int]] = [[row, col]]
        
        while let currentNode = nodeToExplore.popLast() {
            var row = currentNode[0]
            var col = currentNode[1]
            
            guard !visited[row][col] else { continue }
            
            visited[row][col] = true
            
            guard matrix[row][col] == 1 else { continue }
            
            currentRiverSize += 1
            for newNode in getUnvisitedNeighbors(row: row, col: col, matrix: matrix, visited: visited) {
                nodeToExplore.append(newNode)
            }
            
        }
        if currentRiverSize > 0 {
            result.append(currentRiverSize)
        }
    }
    
    private func getUnvisitedNeighbors(row: Int, col: Int, matrix: [[Int]], visited: [[Bool]]) -> [[Int]] {
        let height = matrix.count
        let width = matrix[0].count
        
        // - - t - -
        // - l - r -
        // - - b - -
        
        var unvisitedNeighbors: [[Int]] = []
        if row > 0, !visited[row - 1][col] { // top
            unvisitedNeighbors.append([row - 1, col])
        }
        
        if col < width - 1, !visited[row][col + 1] { // right
            unvisitedNeighbors.append([row, col + 1])
        }
        
        if row < height - 1, !visited[row + 1][col] { // bottom
            unvisitedNeighbors.append([row + 1, col])
        }
        
        if col > 0, !visited[row][col - 1] { // left
            unvisitedNeighbors.append([row, col - 1])
        }
        
        return unvisitedNeighbors
    }
}

class RiverSizeTests: XCTestCase {
    func test1() {
        let sut = Program()
        
        let res = sut.riverSizes([
            [1,0,0,1,0],
            [1,0,1,0,0],
            [0,0,1,0,1],
            [1,0,1,0,1],
            [1,0,1,1,0]
        ]).sorted()
        
        XCTAssertEqual([1,2,2,2,5], res)
    }
    
    func test2() {
        let sut = Program()
        
        let res = sut.riverSizes([
            [0]
        ]).sorted()
        
        XCTAssertEqual([], res)
    }
    
    func test3() {
        let sut = Program()
        
        let res = sut.riverSizes([
            [1]
        ]).sorted()
        
        XCTAssertEqual([1], res)
    }
    
    func test4() {
        let sut = Program()
        
        let res = sut.riverSizes([
            [1, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0]
        ]).sorted()
        
        XCTAssertEqual([1,2,3], res)
    }
}
