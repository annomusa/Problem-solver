//
//  676-implement-magic-dict.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 29/03/22.
//

import XCTest
@testable import AlgorithmExercise

class MagicDictionary {
    
    private var root = TrieNode()
    
    init() {
        
    }
    
    func buildDict(_ dictionary: [String]) {
        
        for str in dictionary {
            var ro: TrieNode? = root
            for chr in str {
                let char = Character("\(chr)")
                if ro?.getChar(char) == nil {
                    ro?.setChar(char)
                }
                ro = ro?.getChar(char)
            }
            ro?.setEnd()
        }
        
    }
    
    func search(_ searchWord: String) -> Bool {
        var mistakeCount: Int = 0
        var ro: TrieNode? = root
        
        var a = [10,2,3]
        a.removeFirst()
        
        for chr in searchWord.enumerated() {
            
            let char = Character("\(chr.element)")
            if let next = ro?.getChar(char) {
                ro = next
            } else if !(ro?.isEnd ?? true) {
                mistakeCount += 1
                if mistakeCount > 1 {
                    return false
                } else {
                    let nextOffset = chr.offset + 1
                    if nextOffset < searchWord.count,
                        let poss = ro?.getPossible() {
                        let nextCharIndex = searchWord.index(
                            searchWord.startIndex,
                            offsetBy: nextOffset
                        )
                        
                        for pos in poss {
                            if let next = pos.getChar(Character("\(searchWord[nextCharIndex])")) {
                                ro = pos
                            }
                        }
                        
                    }
                }
            }
            
        }
        return mistakeCount == 1
    }
}

private class TrieNode {
    private var links: [TrieNode?] = []
    private(set) var isEnd: Bool = false
    init() {
        links = Array(repeating: nil, count: 26)
    }
    
    func setChar(_ char: Character) {
        links[getCharIndex(char)] = TrieNode()
    }
    
    func getChar(_ char: Character) -> TrieNode? {
        return links[getCharIndex(char)]
    }
    
    func getPossible() -> [TrieNode] {
        return links.compactMap { $0 }
    }
    
    func setEnd() {
        isEnd = true
    }
    
    private func getCharIndex(_ char: Character) -> Int {
        return Int(char.asciiValue! - Character("a").asciiValue!)
    }
}

/**
 * Your MagicDictionary object will be instantiated and called as such:
 * let obj = MagicDictionary()
 * obj.buildDict(dictionary)
 * let ret_2: Bool = obj.search(searchWord)
 */

class _676_implement_magic_dict: XCTestCase {
    
    func test0() {
        let magicDictionary = MagicDictionary()
        magicDictionary.buildDict(["hello", "leetcode"])
        XCTAssertFalse(magicDictionary.search("hello")) // return False
        XCTAssertTrue(magicDictionary.search("hhllo")) // We can change the second 'h' to 'e' to match "hello" so we return True
        XCTAssertFalse(magicDictionary.search("hell")) // return False
        XCTAssertFalse(magicDictionary.search("leetcoded")) // return False
    }
    
//    ["MagicDictionary", "buildDict", "search", "search", "search", "search"]
//    [[], [["hello","hallo","leetcode"]], ["hello"], ["hhllo"], ["hell"], ["leetcoded"]]
    func test1() {
        let magicDictionary = MagicDictionary()
        magicDictionary.buildDict(["hello","hallo","leetcode"])
        XCTAssertFalse(magicDictionary.search("hello")) // return False
        XCTAssertTrue(magicDictionary.search("hhllo")) // We can change the second 'h' to 'e' to match "hello" so we return True
        XCTAssertFalse(magicDictionary.search("hell")) // return False
        XCTAssertFalse(magicDictionary.search("leetcoded")) // return False
    }
}
