//
//  1152-analyze-user-website-visit-pattern.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 16/04/22.
//

import Foundation
import XCTest

private class Solution {
    struct VisitedWebsite {
        let website: String, timestamp: Int
    }
    
    func mostVisitedPattern(_ username: [String], _ timestamp: [Int], _ website: [String]) -> [String] {
        var usersDict               : [String: [VisitedWebsite]]    = [:]
        var usersSortedDict         : [String: [String]]            = [:]
        var userSubSequencesDict    : [String: [String: Bool]]      = [:]
        var validSubSequencesCount  : [String: Int]                 = [:]
        
        for (idx, site) in website.enumerated() {
            let new = VisitedWebsite(website: site, timestamp: timestamp[idx])
            var currentArr: [VisitedWebsite] = usersDict[username[idx], default: []] + [new]
            currentArr.sort(by: { $0.timestamp < $1.timestamp })
            usersDict[username[idx]] = currentArr
            usersSortedDict[username[idx]] = currentArr.map{ $0.website }
        }
        
        for (username, _) in usersSortedDict {
            userSubSequencesDict[username] = [:]
            generateSubsequence("", username, 0, 0, &userSubSequencesDict, &usersSortedDict)
        }
        
        for (user,value) in userSubSequencesDict {
            for (k,_) in value {
                validSubSequencesCount[k] = (validSubSequencesCount[k] ?? 0) + 1
            }
        }
        
        let arr = validSubSequencesCount.sorted(by: { dict1, dict2 in
            if dict1.value == dict2.value {
                return dict1.key < dict2.key
            }
            return dict1.value > dict2.value
        }).map({$0.key})
        
        return arr[0].components(separatedBy: ".")
    }
    
    private func generateSubsequence(
        _ currentSites: String,
        _ userName: String,
        _ siteIndex: Int,
        _ count: Int,
        _ userSubSequencesDict: inout [String: [String: Bool]],
        _ usersSortedDict: inout [String: [String]]
    ) {
        if count == 3 {
            var currentStr = currentSites
            currentStr.removeLast()
            userSubSequencesDict[userName]![currentStr] = true
            return
        }
        let sitesVisited = usersSortedDict[userName]!
        for i in siteIndex..<sitesVisited.count {
            var current = currentSites + sitesVisited[i] + "."
            generateSubsequence(current, userName, i + 1, count + 1, &userSubSequencesDict, &usersSortedDict)
        }
    }
}

class AnalyzeUserWebsiteVisitPatternTests: XCTestCase {
    
    func test1() {
        
        var sut = Solution()
        
        var res = sut.mostVisitedPattern(
            ["joe","joe","joe","james","james","james","james","mary","mary","mary"],
            [1,    2,    3,    4,      5,      6,       7,     8,      9,    10],
            ["home","about","career","home","cart","maps","home","home","about","career"]
        )
        
        XCTAssertEqual(
            res,
            ["home","about","career"]
        )
        
        var res2 = sut.mostVisitedPattern(
            ["ua","ua","ua","ub","ub","ub"],
            [1,   2,   3,   4,   5,   6],
            ["a","b","a","a","b","c"]
        )
        
        XCTAssertEqual(
            res2,
            ["a", "b", "a"]
        )
        
        var res3 = sut.mostVisitedPattern(
            ["ua","ua","ua","ub","ub","ub"],
            [1,2,3,4,5,6],
            ["a","b","c","a","b","a"]
        )
        
        XCTAssertEqual(
            res3,
            ["a","b","a"]
        )
        
        var res4 = sut.mostVisitedPattern(
            ["zkiikgv","zkiikgv","zkiikgv","zkiikgv"],
            [436363475,710406388,386655081,797150921],
            ["wnaaxbfhxp","mryxsjc","oz","wlarkzzqht"]
        )
        
        XCTAssertEqual(
            res4,
            ["oz","mryxsjc","wlarkzzqht"]
        )
        
        var res5 = sut.mostVisitedPattern(
            ["h","eiy","cq","h","cq","txldsscx","cq","txldsscx","h","cq","cq"],
            [527896567,334462937,517687281,134127993,859112386,159548699,51100299,444082139,926837079,317455832,411747930],
            ["hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","hibympufi","yljmntrclw","hibympufi","yljmntrclw"]
        )
        
        XCTAssertEqual(
            res5,
            ["hibympufi","hibympufi","yljmntrclw"]
        )
        
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
