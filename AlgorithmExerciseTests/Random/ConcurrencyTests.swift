//
//  ConcurrencyTests.swift
//  AlgorithmExerciseTests
//
//  Created by Anno Musa on 07/04/22.
//

import Foundation
import XCTest
import Dispatch

class User {
    var name: String = "spontan"
}
func singleton() -> Singleton {
    Singleton.shared
}
class Singleton: NSObject {
    
    @objc static var shared: Singleton = Singleton()
    
    private var _currentUser: User? = User()
    private var _username: String = ""
    var currentUser: User? {
        get {
            objc_sync_enter(self)
            defer { objc_sync_exit(self) }
            
            return _currentUser
        }
        set {
            objc_sync_enter(self)
            defer { objc_sync_exit(self) }
            
            if let newValue = newValue {
                _username = newValue.name
                _currentUser = newValue
            } else {
                _username = ""
                _currentUser = nil
            }
        }
    }
    
    func getUsername() -> String {
        if let user = currentUser {
            return user.name
        }
        return ""
    }
    
    override init() {
        super.init()
    }
    
}

class UserDependent {
    var personality: String = "uhuy"
    init(name: String) {
        personality = "\(name) \(personality)"
    }
}

class SingletonTests: XCTestCase {
    
    func xtestString() {
        for queue in 0..<20 {
            let qos: DispatchQoS.QoSClass
            switch queue % 10 {
            case 0:
                qos = .userInitiated
//            case 1:
//                qos = .userInteractive
            default:
                qos = .background
            }
            let queue = DispatchQueue.global(qos: qos)
            queue.async {
                DispatchQueue.concurrentPerform(iterations: 10_000) { val in
                    let dep = UserDependent(name: singleton().getUsername())
                    var new = dep.personality
                }
            }
            DispatchQueue.main.async {
                singleton().currentUser = User()
            }
        }
        Thread.sleep(forTimeInterval: 20)
    }
    
    func xtest1() {
        let count = 10_000
        let alldone = expectation(description: "alldone")
        alldone.expectedFulfillmentCount = count
        
        DispatchQueue.main.async {
            DispatchQueue.concurrentPerform(iterations: count) { count in
                XCTAssertEqual(Singleton.shared.currentUser!.name, "spontan")
            }
        }
//        
        DispatchQueue.global(qos: .userInitiated).async {
            DispatchQueue.concurrentPerform(iterations: count) { count in
                Singleton.shared.currentUser!.name = "spontan"
                XCTAssertEqual(Singleton.shared.currentUser!.name, "spontan")
            }
        }
        
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.concurrentPerform(iterations: count) { count in
                let new = UserDependent(name: Singleton.shared.currentUser?.name ?? "aadc")
                XCTAssertEqual(new.personality, "spontan uhuy")
                alldone.fulfill()
            }
        }
        
        wait(for: [alldone], timeout: 15)
    }
    
    func xtest2() {
        let alldone = expectation(description: "alldone")
        alldone.expectedFulfillmentCount = 5
        DispatchQueue.concurrentPerform(iterations: 5) { count in
            DispatchQueue.global(qos: .userInteractive).async {
                print(count)
                let cur = Singleton.shared.currentUser
                if cur == nil {
                    Singleton.shared.currentUser = User()
                }
                var c = Singleton.shared.currentUser?.name
                let num = Int(c ?? "") ?? 0
                Singleton.shared.currentUser?.name = "\(num + count)"
                alldone.fulfill()
            }
        }
        
        wait(for: [alldone], timeout: 2)
        
        let res = Singleton.shared.currentUser?.name
        
        XCTAssertEqual("10", res)
    }
    
    func xtest3() {
        let alldone = expectation(description: "alldone")
        alldone.expectedFulfillmentCount = 5
        DispatchQueue.concurrentPerform(iterations: 5) { count in
            DispatchQueue.main.async {
                print(count)
                let cur = Singleton.shared.currentUser
                if cur == nil {
                    Singleton.shared.currentUser = User()
                }
                var c = Singleton.shared.currentUser?.name
                let num = Int(c ?? "") ?? 0
                Singleton.shared.currentUser?.name = "\(num + count)"
                alldone.fulfill()
            }
        }
        
        wait(for: [alldone], timeout: 2)
        
        let res = Singleton.shared.currentUser?.name
        
        XCTAssertEqual("10", res)
    }
}
