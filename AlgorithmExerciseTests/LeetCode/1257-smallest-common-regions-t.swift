//
//  1257-smallest-common-regions-t.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 25/03/22.
//

import XCTest
@testable import AlgorithmExercise

private class Solution {
    
    typealias Tree = [String: [String]]
    
    var ans: String = ""
    
    /*
     ["Earth","North America","South America"],
     ["North America","United States","Canada"],
     ["United States","New York","Boston"],
     ["Canada","Ontario","Quebec"],
     ["South America","Brazil"]
     "Quebec" x "New York"
     
     */
    func findSmallestRegion(
        _ regions: [[String]], _ region1: String, _ region2: String
    ) -> String {
        var tree: Tree = [:]
        
        for region in regions {
            tree[region.first!] = Array(region.dropFirst())
        }
        
        recurse(tree: tree, root: regions[0][0], p: region1, q: region2)
        
        return ans
    }
    
    private func recurse(
        tree: Tree, root: String, p: String, q: String
    ) -> Bool {
        
        var count = 0
        
        for reg in tree[root, default: []] {
            count += recurse(tree: tree, root: reg, p: p, q: q) ? 1 : 0
        }
        
        count += (root == p || root == q) ? 1 : 0
        
        if tree[root] != nil && count >= 2 {
            ans = root
            return true
        }
        
        return count == 1
    }
}

class _1257_smallest_common_regions_t: XCTestCase {
    
    func test0() {
        let sut = Solution()
        
        let res = sut.findSmallestRegion(
            [
                ["Earth","North America","South America"],
                ["North America","United States","Canada"],
                ["United States","New York","Boston"],
                ["Canada","Ontario","Quebec"],
                ["South America","Brazil"]
            ],
            "Quebec",
            "New York"
        )
        
        XCTAssertEqual(res, "North America")
    }
    
    func xtest1() {
        let sut = Solution()
        
        let res = sut.findSmallestRegion(
            [
                ["Earth", "North America", "South America"],
                ["North America", "United States", "Canada"],
                ["United States", "New York", "Boston"],
                ["Canada", "Ontario", "Quebec"],
                ["South America", "Brazil"]
            ],
            "Canada",
            "South America"
        )
        
        XCTAssertEqual(res, "Earth")
    }
}
