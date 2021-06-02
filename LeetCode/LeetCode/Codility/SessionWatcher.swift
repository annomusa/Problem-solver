//
//  SessionWatcher.swift
//  LeetCode
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation

protocol WorkItemProvider {
    func workItem(actionBlock: @escaping () -> ()) -> DispatchWorkItem?
}

class DefaultWorkItemProvider: WorkItemProvider {
    func workItem(actionBlock: @escaping () -> ()) -> DispatchWorkItem? {
        return DispatchWorkItem(block: actionBlock)
    }
}

class SessionWatcher {
    private var workItemProvider: WorkItemProvider
    private var workItem: DispatchWorkItem?
    private let sessionTime: TimeInterval
    private let queue: DispatchQueue
    
    var onTimeExceeded: (() -> Void)?
    
    init(sessionTime: TimeInterval = 5, workItemProvider: WorkItemProvider, queue: DispatchQueue) {
        self.workItemProvider = workItemProvider
        self.sessionTime = sessionTime
        self.queue = queue
    }
    
    func start() {
        receivedUserAction()
    }
    
    func receivedUserAction() {
        workItem?.cancel()
        workItem = nil
        workItem = workItemProvider.workItem { [weak self] in
            self?.onTimeExceeded?()
        }
        queue.asyncAfter(deadline: .now() + sessionTime) { [weak workItem] in
            workItem?.perform()
        }
    }
    
    func stop() {
        workItem?.cancel()
    }
}
