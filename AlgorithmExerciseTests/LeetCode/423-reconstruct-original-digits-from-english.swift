//
//  423-reconstruct-original-digits-from-english.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 27/04/22.
//

import Foundation
import XCTest

private class Solution {
    /*
     zero,
     two,
     four,
     six,
     eight,
     
     three, -> eight
     five, -> four
     seven, -> six
     nine, -> five, six, eight
     one,
     */
    func originalDigits(_ s: String) -> String {
        var res: String = ""
        
        var counter: [Character: Int] = [:]
        for char in s {
            counter[char] = counter[char, default: 0] + 1
        }
        
        var digit: [Int] = Array(repeating: 0, count: 10)
        
        digit[0] = counter["z", default: 0]
        digit[2] = counter["w", default: 0]
        digit[4] = counter["u", default: 0]
        digit[6] = counter["x", default: 0]
        digit[8] = counter["g", default: 0]
        
        digit[3] = counter["h", default: 0] - digit[8]
        digit[5] = counter["f", default: 0] - digit[4]
        digit[7] = counter["s", default: 0] - digit[6]
        digit[9] = counter["i", default: 0] - digit[5] - digit[6] - digit[8]
        digit[1] = counter["n", default: 0] - (2 * digit[9]) - digit[7]
        
        print("originalzz \(digit)")
        
        for i in 0..<10 {
            let count = digit[i]
            if count > 0 {
                for j in 0..<count {
                    res.append("\(i)")
                }
            }
        }
        
        return res
    }
}

class ReconstructOriginalDigitsFromEnglishTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
//        XCTAssertEqual(sut.originalDigits("owoztneoer"), "012")
//
//        XCTAssertEqual(sut.originalDigits("fviefuro"), "45")
        
        XCTAssertEqual(sut.originalDigits("nnei"), "9")
    }
    
    
}
