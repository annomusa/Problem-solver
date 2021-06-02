//
//  SessionWatcherTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class SessionWatcherTests: XCTestCase {
    
    var sut: SessionWatcher!
    
    private var queue: DispatchQueue!
    private var workItemProvider: WorkItemProvider!
    
    override func setUp() {
        queue = DispatchQueue(label: "sessio.watcher")
        workItemProvider = DefaultWorkItemProvider()
        sut = SessionWatcher(
            sessionTime: 5,
            workItemProvider: workItemProvider,
            queue: queue
        )
    }
    
    func test_correctlyExecutedWorkItemWhenStartCalledTwoTimes() {
        
        var exceededCalledCount: Int = 0
        sut.onTimeExceeded = {
            exceededCalledCount += 1
        }
        
        sut.start()
        sut.start()
        let delay = expectation(description: "Waiting with no trigger to use user action")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            delay.fulfill()
        }
        
        waitForExpectations(timeout: 5, handler: nil)
        XCTAssertEqual(exceededCalledCount, 1)
        
        sut.stop()
    }
    
//    TaskTests.TaskTests - test_weakSelfInActionBlock
//    OK
//
//    TaskTests.TaskTests - test_startAction_onTimeExceededCalledAfterInitialSessionTime
//    OK
//
//    TaskTests.TaskTests - test_stopAction_onTimeExceededNotCalledAfterStop
//    OK
//
//    TaskTests.TaskTests - test_startAction_actionBlockCalledAfterGivenSessionTime
//    OK
//
//    TaskTests.TaskTests - test_receivedUserAction_onTimeExceededCountCorrect
//    WRONG ANSWER
//
//    TaskTests.TaskTests - test_stopAction_workItemCancelledAfterStopCalled
//    OK
//
//    TaskTests.TaskTests - test_workItem_actionBlockHasBeenPassed
//    OK
//
//    TaskTests.TaskTests - test_startAction_workItemCancelledOnStart
//    OK
//
//    TaskTests.TaskTests - test_correctlyExecutedWorkItemWhenStartCalledTwoTimes
//    WRONG ANSWER
//
//    TaskTests.TaskTests - test_receivedUserAction_firstWorkItemShouldBeCancelled
//    OK
//
//    TaskTests.TaskTests - test_startAction_workItemCreatedAfterStart
//    OK
//
//    TaskTests.TaskTests - test_stopAction_workItemCancelledAfterStopCalledCase2
//    OK
//
//    TaskTests.TaskTests - test_startAction_actionBlockCalledAfterGivenSessionTimeCase2
//    OK
//
//    TaskTests.TaskTests - test_receivedUserAction_secondWorkItemCreatedAfterReceivedAction
//    OK
//
//    TaskTests.TaskTests - test_startAction_onTimeExceededHasNotBeenCalledAfterStart
//    OK
//
//    TaskTests.TaskTests - test_initialState_onTimeExceededNotCalledRightAfterStartAndBefore
//    OK
//
//    TaskTests.TaskTests - test_startAction_workItemExecutedOnCorrectQueue
//    OK
//
//    TaskTests.TaskTests - test_workItem_hasBeenCreated
//    OK
//
//    TaskTests.TaskTests - test_startAction_actionBlockHasBeenPassed
//    OK
//
//    TaskTests.TaskTests - test_initialState_didNotCreateAWorkItemBeforeStart
//    OK
}
