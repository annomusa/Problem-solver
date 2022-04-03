//
//  GroupAnagrams.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 01/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Program {
    func groupAnagrams(_ words: [String]) -> [[String]] {
        var result: [[String]] = []
        
        for word in words {
            guard !result.isEmpty else {
                result.append([word])
                continue
            }
            
            var anagramIndex: Int?
            for res in result.enumerated() where !res.element.isEmpty {
                guard let first = res.element.first else { continue }
                
                if isAnagram(str1: word, str2: first) {
                    anagramIndex = res.offset
                }
            }
            
            if let anagramIndex = anagramIndex {
                result[anagramIndex].append(word)
            } else {
                result.append([word])
            }
            
        }
        
        return result
    }
    
    private func isAnagram(str1: String, str2: String) -> Bool {
        guard str1.count == str2.count else { return false }
        
        var map: [Character: Int] = [:]
        for char in str1 {
            map[char, default: 0] += 1
        }
        for char in str2 {
            if let count = map[char], count == 1 {
                map[char] = nil
            } else if let count = map[char] {
                map[char] = count - 1
            } else {
                return false
            }
        }
        
        return map.isEmpty
    }
}

class GroupAnagramsTests: XCTestCase {
    
    func test1() {
        let sut = Program()
        
        sut.groupAnagrams(["yo", "act", "flop", "tac", "foo", "cat", "oy", "olfp"])
        
    }
    
}

