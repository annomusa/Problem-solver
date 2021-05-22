//
//  CropTheMessage.swift
//  LeetCode
//
//  Created by Anno Musa on 21/05/21.
//

import Foundation

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
