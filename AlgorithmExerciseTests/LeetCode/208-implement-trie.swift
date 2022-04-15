//
//  208-implement-trie.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 29/03/22.
//

import XCTest
@testable import AlgorithmExercise

private class Trie {
    
    private var dictionary: [String: [String]] = [:]
    private var dictionary2: [String: Bool] = [:]
    
    init() { }
    
    func insert(_ word: String) {
        guard let root = word.first else { return }
        
        dictionary2[word] = true
        
        var currRoot = "\(root)"
        
        for i in 1..<word.count {
            let range = 0...i
            let sub = "\(word.prefix(range.lowerBound + range.count).suffix(range.count))"
            dictionary[currRoot, default: []].append(sub)
            currRoot = sub
        }
        
    }
    
    func search(_ word: String) -> Bool {
        return dictionary2[word] ?? false
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var res = !dictionary[prefix, default: []].isEmpty
        if res { return true }
        
        return dictionary2[prefix] ?? false
    }
}

/**
 * Your Trie object will be instantiated and called as such:
 * let obj = Trie()
 * obj.insert(word)
 * let ret_2: Bool = obj.search(word)
 * let ret_3: Bool = obj.startsWith(prefix)
 */

class _208_implement_trie: XCTestCase {
    
    func test1() {
        let trie = Trie2()
        trie.insert("apple")
        XCTAssertTrue(trie.search("apple"))   // return True
        XCTAssertFalse(trie.search("app"))     // return False
        XCTAssertTrue(trie.startsWith("app")) // return True
        trie.insert("app")
        XCTAssertTrue(trie.search("app"))     // return True
    }
    
    func test2() {
        let trie = Trie2()
        trie.insert("a")
        XCTAssertTrue(trie.search("a"))   // return True
        XCTAssertTrue(trie.startsWith("a")) // return True
    }
}

private class Trie2 {
    private var root: TrieNode = TrieNode()
    
    init() {
        
    }
    
    func insert(_ word: String) {
        var node: TrieNode? = root
        
        for c in word {
            var char = Character("\(c)")
            if node?.getNode(char) == nil {
                node?.putNode(char)
            }
            node = node?.getNode(char)
        }
        node?.setEnd()
    }
    
    func search(_ word: String) -> Bool {
        var node = root
        
        for c in word {
            var char = Character("\(c)")
            if let next = node.getNode(char) {
                node = next
            } else {
                return false
            }
        }
        
        return node.isEnd
    }
    
    func startsWith(_ prefix: String) -> Bool {
        var node = root
        
        for c in prefix {
            var char = Character("\(c)")
            if let next = node.getNode(char) {
                node = next
            } else {
                return false
            }
        }
        
        return true
    }
}

private class TrieNode {
    private let R = 26
    private var links: [TrieNode?] = []
    
    private(set) var isEnd = false
    
    init() {
        links = Array(repeating: nil, count: R)
    }
    
    func getNode(_ char: Character) -> TrieNode? {
        return links[getIndexOf(char)]
    }
    
    func putNode(_ char: Character) {
        links[getIndexOf(char)] = TrieNode()
    }
    
    func setEnd() {
        isEnd = true
    }
    
    private func getIndexOf(_ char: Character) -> Int {
        return Int(char.asciiValue! - Character("a").asciiValue!)
    }
}
