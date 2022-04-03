//
//  SuffixTrieConstruction.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 01/04/22.
//

import Foundation
import XCTest

private class Program {
    // Do not edit the class below except for the
    // populateSuffixTrieFrom and contains methods.
    // Feel free to add new properties and methods
    // to the class.
    class TrieNode {
        var children: [String: Any] = [:]
    }
    
    class SuffixTrie {
        var root = TrieNode()
        let endSymbol = "*"
        
        init(string: String) {
            populateSuffixTrieFrom(string: string)
        }
        
        func populateSuffixTrieFrom(string: String) {
            
            for char in string.reversed() {
                root.children["\(char)"] = ["*"]
            }
            
        }
        
        func contains(string: String) -> Bool {
            // Write your code here.
            return false
        }
    }
}

class SuffixTrieConstruction: XCTestCase {
    
    func test1() {
        let sut = Program.SuffixTrie(string: "babc")
        
        let res = sut.contains(string: "abc")
        
    }
    
}
