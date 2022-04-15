//
//  1268-search-suggestions-system.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 15/04/22.
//

import Foundation
import XCTest

private class Solution {
    func suggestedProducts(_ products: [String], _ searchWord: String) -> [[String]] {
        var res: [[String]] = []
        
        let trie = Trie()
        
        // insertion complexity = n * m
        for product in products {
            trie.insert(str: product)
        }
        
        var prefix = ""
        // searching complexity = m * m
        for c in searchWord {
            prefix.append(c)
            res.append(trie.getWordsWithPrefix(prefix))
        }
        
        return res
    }
}

class SearchSuggestionsSystemTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        var res1 = sut.suggestedProducts(
            ["mobile","mouse","moneypot","monitor","mousepad"],
            "mouse"
        )
        XCTAssertEqual(res1, [
            ["mobile","moneypot","monitor"],
            ["mobile","moneypot","monitor"],
            ["mouse","mousepad"],
            ["mouse","mousepad"],
            ["mouse","mousepad"]
        ])
        
        var res2 = sut.suggestedProducts(
            ["havana"],
            "havana"
        )
        XCTAssertEqual(res2, [
            ["havana"],
            ["havana"],
            ["havana"],
            ["havana"],
            ["havana"],
            ["havana"]
        ])
        
        var res3 = sut.suggestedProducts(
            ["bags","baggage","banner","box","cloths"],
            "bags"
        )
        XCTAssertEqual(res3, [
            ["baggage","bags","banner"],
            ["baggage","bags","banner"],
            ["baggage","bags"],
            ["bags"]
        ])
        
    }
    
}

private class Trie {
    
    class Node {
        var isWord: Bool = false
        var children: [Character: Node] = [:]
    }
    
    var root: Node = Node()
    
    func insert(str: String) {
        var curr: Node? = root
        for c in str {
            if curr?.children[c] == nil {
                curr?.children[c] = Node()
            }
            curr = curr?.children[c]
        }
        curr?.isWord = true
    }
    
    func getWordsWithPrefix(_ prefix: String) -> [String] {
        var result: [String] = []
        var curr: Node? = root
        for c in prefix {
            if curr?.children[c] == nil {
                return result
            }
            curr = curr?.children[c]
        }
        dfsWithPrefix(curr: curr, word: prefix, result: &result)
        return result
    }
    
    func dfsWithPrefix(curr: Node?, word: String, result: inout [String]) {
        if result.count == 3 {
            return
        }
        if curr?.isWord == true {
            result.append(word)
        }
        
        for c in "abcdefghijklmnopqrstuvwxyz" {
            if let node = curr?.children[c] {
                dfsWithPrefix(curr: node, word: word.appending(String(c)), result: &result)
            }
        }
    }
}

extension Character {
    var alphabetIndex: Int {
        return Int(asciiValue! - Character("a").asciiValue!)
    }
}
