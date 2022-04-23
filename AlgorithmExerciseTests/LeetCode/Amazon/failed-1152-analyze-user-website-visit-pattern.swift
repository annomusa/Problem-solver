//
//  1152-analyze-user-website-visit-pattern.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation
import XCTest

private class Solution {
    struct Item {
        var username: String, timestamp: Int, website: String
    }
    
    func mostVisitedPattern(_ username: [String], _ timestamp: [Int], _ website: [String]) -> [String] {
        var res: [String] = []
        
        let n = username.count
        
        var items: [Item] = []
        
        var userPattern: [String: [String]] = [:]
        
        var websiteCount = Set(website).count
        
        for i in 0..<n {
            userPattern[username[i]] = [""]
            let new = Item(username: username[i], timestamp: timestamp[i], website: website[i])
            items.append(new)
        }
        
        items.sort { it1, it2 in
            return it1.timestamp < it2.timestamp
        }
        
        for pat in userPattern.keys {
            userPattern[pat] = items.filter { $0.username == pat }.map { $0.website }
        }
        
        for pat in userPattern {
            if pat.value.count < 3 {
                userPattern[pat.key] = nil
            }
        }
        
        //        print(userPattern)
        
        //        if userPattern.count < 2 {
        //            return userPattern.first!.value
        //        }
        
        var webCombination: [([String], Int)] = []
        for pat in userPattern {
            for combo in Set(pat.value.combinations(ofCount: 3)) {
                if let idx = webCombination.firstIndex(where: { $0.0 == combo }) {
                    webCombination[idx].1 = webCombination[idx].1 + 1
                } else {
                    webCombination.append(
                        (combo, 1)
                    )
                }
            }
        }
        
        let max = webCombination.max { com1, com2 in
            if com1.1 == com2.1 {
                let a = com1.0.reduce("", { "\($0)\($1)" })
                let b = com2.0.reduce("", { "\($0)\($1)" })
                return a > b
            }
            return com1.1 < com2.1
        }
        
        return max!.0
    }
}

class FailedAnalyzeUserWebsiteVisitPatternTests: XCTestCase {
    
    func test1() {
        var sut = Solution()
        
        //        var res = sut.mostVisitedPattern(
        //            ["joe","joe","joe","james","james","james","james","mary","mary","mary"],
        //            [1,    2,    3,    4,      5,      6,       7,     8,      9,    10],
        //            ["home","about","career","home","cart","maps","home","home","about","career"]
        //        )
        //
        //        XCTAssertEqual(
        //            res,
        //            ["home","about","career"]
        //        )
        //
        //        var res2 = sut.mostVisitedPattern(
        //            ["ua","ua","ua","ub","ub","ub"],
        //            [1,   2,   3,   4,   5,   6],
        //            ["a","b","a","a","b","c"]
        //        )
        //
        //        XCTAssertEqual(
        //            res2,
        //            ["a", "b", "a"]
        //        )
        
        //        var res3 = sut.mostVisitedPattern(
        //            ["ua","ua","ua","ub","ub","ub"],
        //            [1,2,3,4,5,6],
        //            ["a","b","c","a","b","a"]
        //        )
        //
        //        XCTAssertEqual(
        //            res3,
        //            ["a","b","a"]
        //        )
        
        //        var res4 = sut.mostVisitedPattern(
        //            ["zkiikgv","zkiikgv","zkiikgv","zkiikgv"],
        //            [436363475,710406388,386655081,797150921],
        //            ["wnaaxbfhxp","mryxsjc","oz","wlarkzzqht"]
        //        )
        //
        //        XCTAssertEqual(
        //            res4,
        //            ["oz","mryxsjc","wlarkzzqht"]
        //        )
        
        //        var res5 = sut.mostVisitedPattern(
        //            ["h","eiy","cq","h","cq","txldsscx","cq","txldsscx","h","cq","cq"],
        //            [527896567,334462937,517687281,134127993,859112386,159548699,51100299,444082139,926837079,317455832,411747930],
        //            ["hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","yljmntrclw","hibympufi","yljmntrclw"]
        //        )
        //
        //        XCTAssertEqual(
        //            res5,
        //            ["hibympufi","hibympufi","yljmntrclw"]
        //        )
        
        var res6 = sut.mostVisitedPattern(
            ["him","mxcmo","jejuvvtye","wphmqzn","uwlblbrkqv","flntc","esdtyvfs","nig","jejuvvtye","nig","mxcmo","flntc","nig","jejuvvtye","odmspeq","jiufvjy","esdtyvfs","mfieoxff","nig","flntc","mxcmo","qxbrmo"],
            [113355592,304993712,80831183,751306572,34485202,414560488,667775008,951168362,794457022,813255204,922111713,127547164,906590066,685654550,430221607,699844334,358754380,301537469,561750506,612256123,396990840,60109482],
            ["k","o","o","nxpvmh","dssdnkv","kiuorlwdcw","twwginujc","evenodb","qqlw","mhpzoaiw","jukowcnnaz","m","ep","qn","wxeffbcy","ggwzd","tawp","gxm","pop","xipfkhac","weiujzjcy","x"]
        )
        
        XCTAssertEqual(
            res6,
            ["m","kiuorlwdcw","xipfkhac"]
        )
    }
    
}
