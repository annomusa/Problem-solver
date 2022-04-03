//
//  ValidIpAddresses.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 01/04/22.
//

import Foundation
@testable import AlgorithmExercise
import XCTest

private class Program {
    /*
     
     */
    let segmentRange = 0...255
    
    func validIPAddresses(_ string: String) -> [String] {
        guard string.count > 3 else { return [] }
        
        return recurse(curr: "", segment: 0, string: string)
    }
    
    private func recurse(curr: String, segment: Int, string: String) -> [String] {
        guard ((4-segment)...((4-segment) * 3)).contains(string.count)
        else {
            return []
        }
        
        if segment == 3, let val = Int(string: string) {
            if segmentRange.contains(val) {
                return ["\(curr)\(val)"]
            } else {
                return []
            }
        }
        
        var res: [String] = []
        
        for i in 0..<3 {
            guard i < string.count else { break }
            
            let val = String(string[0...i])
            if let int = Int(string: val), segmentRange.contains(int) {
                
                let newString = String(string.dropFirst(i + 1))
                let curr = "\(curr)\(val)."
                
                var recu = recurse(
                    curr: curr,
                    segment: segment + 1,
                    string: newString
                )
                for re in recu {
                    res.append(re)
                }
                
            }
            
        }
        
        return res
    }
}

private extension StringProtocol {
    subscript(offset: Int) -> Character {
        self[index(startIndex, offsetBy: offset)]
    }
    
    subscript(range: Range<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    
    subscript(range: ClosedRange<Int>) -> SubSequence {
        let startIndex = index(self.startIndex, offsetBy: range.lowerBound)
        return self[startIndex..<index(startIndex, offsetBy: range.count)]
    }
    
    subscript(range: PartialRangeFrom<Int>) -> SubSequence {
        self[index(startIndex, offsetBy: range.lowerBound)...]
    }
    
    subscript(range: PartialRangeThrough<Int>) -> SubSequence {
        self[...index(startIndex, offsetBy: range.upperBound)]
    }
    
    subscript(range: PartialRangeUpTo<Int>) -> SubSequence {
        self[..<index(startIndex, offsetBy: range.upperBound)]
    }
}

extension Int {
    init?(string: String) {
        if string.count > 1, string[0] == "0" {
            return nil
        }
        self.init(string)
    }
}

class ValidIpAddresses: XCTestCase {
    
    func test1() {
        
        let sut = Program()
        
        let a = Int(string: "001")
        let b = Int(string: "01")
        let c = Int(string: "0")
        
        let res = sut.validIPAddresses("1921680")
        let expected = [
            "1.9.216.80",
            "1.92.16.80",
            "1.92.168.0",
            "19.2.16.80",
            "19.2.168.0",
            "19.21.6.80",
            "19.21.68.0",
            "19.216.8.0",
            "192.1.6.80",
            "192.1.68.0",
            "192.16.8.0",
        ]
        XCTAssertEqual(expected, res)
    }
    
    func test2() {
        
        let sut = Program()
        
        let res = sut.validIPAddresses("00001")
        let expected: [String] = []
        XCTAssertEqual(expected, res)
    }
    
}
