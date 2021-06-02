//
//  TwoDArray.swift
//  LeetCode
//
//  Created by Anno Musa on 23/05/21.
//

import Foundation

class TwoDArray {
    func hourglassSum(arr: [[Int]]) -> Int {
        
        var hourglassTable: [Int] = []
        
        for i in 0...3 {
            
            for j in 0...3 {
                
                let topSum = arr[i][j] + arr[i][j+1] + arr[i][j+2]
                let midSum = arr[i+1][j+1]
                let botSum = arr[i+2][j] + arr[i+2][j+1] + arr[i+2][j+2]
                
                let total = topSum + midSum + botSum
                hourglassTable.append(total)
                
//                print("hour: ", "\(i)x\(j) -> \(total) -> \(topSum), \(midSum), \(botSum)")
            }
            
        }
        
        return hourglassTable.max()!
    }
}
