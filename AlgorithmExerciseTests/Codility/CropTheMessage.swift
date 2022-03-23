//
//  CropTheMessageTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

class CropTheMessage {
    
    func solution(_ message : inout String, _ K : Int) -> String {
        
        let words: [String] = message.components(separatedBy: " ")
        var result: [String] = []
        var currentLength: Int = 0
        
        for word in words {
            var wordCount: Int = word.count
            
            if !result.isEmpty {
                wordCount += 1
            }
            if (wordCount + currentLength) <= K {
                result.append(word)
                currentLength += wordCount
            } else {
                break
            }
        }
        
        return result.joined(separator: " ")
    }
    
}


class CropTheMessageTests: XCTestCase {
    
    var sut: CropTheMessage!
    
    override func setUp() {
        sut = CropTheMessage()
    }
    
    func testExample1() {
        var message: String = "Codility We test coders"
        let res = sut.solution(&message, 14)
        let expectation = "Codility We"
        
        XCTAssertEqual(res, expectation)
        XCTAssertEqual(res.count, expectation.count)
    }
    
    func testExample2() {
        var message: String = "Why not"
        
        let res = sut.solution(&message, 100)
        let expectation = "Why not"
        
        XCTAssertEqual(res, expectation)
        XCTAssertEqual(res.count, expectation.count)
    }
    
    func testExample3() {
        var message: String = "The quick brown fox jumps over the lazy dog"
        let res = sut.solution(&message, 39)
        let expectation = "The quick brown fox jumps over the lazy"
        
        XCTAssertEqual(res, expectation)
        XCTAssertEqual(res.count, expectation.count)
    }
    
    func testExample4() {
        var message: String = "To crop or not to crop"
        let res = sut.solution(&message, 21)
        let expectation = "To crop or not to"
        
        XCTAssertEqual(res, expectation)
        XCTAssertEqual(res.count, expectation.count)
    }
    
    func testLongSentences() {
        var message = "So of course RIGHT in the EXACT MIDDLE of my holiday what happens Im sent a whole batch of tasks to be edited at MAXIMUM INCONVENIENCE to myself directly ignoring my very clear request Thus I am not very pleased Its a near miracle that I brought my laptop with me and had I not done so I wouldnt have been able to do this editing until aftermy return nearly a week from now"
        let res = sut.solution(&message, 128)
        let expectation = "So of course RIGHT in the EXACT MIDDLE of my holiday what happens Im sent a whole batch of tasks to be edited at MAXIMUM"
        
        XCTAssertEqual(res, expectation)
        XCTAssertEqual(res.count, expectation.count)
    }
}
