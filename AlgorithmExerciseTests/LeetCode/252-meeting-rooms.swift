//
//  252-meeting-rooms.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 20/04/22.
//

import Foundation
import XCTest

private class Solution {
    func canAttendMeetings(_ intervals: [[Int]]) -> Bool {
        guard intervals.count > 0 else { return true }
        
        var intervals = intervals
        intervals.sort { arr1, arr2 in
            return arr1[0] < arr2[0]
        }
        
        for idx in 1..<intervals.count where intervals[idx - 1][1] > intervals[idx][0] {
            return false
        }
        
        return true
    }
}

class MeetingRoomsTests: XCTestCase {
    
    func test1() {
        
        let sut = Solution()
        
        XCTAssertFalse(sut.canAttendMeetings([[0,30],[5,10],[15,20]]))
        
        XCTAssertTrue(sut.canAttendMeetings([[7,10],[2,4]]))
        
        XCTAssertTrue(sut.canAttendMeetings([]))
        
    }
    
}
