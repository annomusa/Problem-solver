//
//  SwiftValueTypeTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

final class HtmlMutableString: NSObject, NSMutableCopying {
    /// Please do not modify this class.
    static var mutationsCount = 0
    
    private(set) var data: String = ""
    override var description: String {
        return data
    }
    
    override init() {
        super.init()
    }
    
    init(string: String) {
        super.init()
        data = string
    }
    
    func append(_ val: HtmlMutableString) {
        data.append(val.data)
    }
    
    func mutableCopy(with zone: NSZone? = nil) -> Any {
        HtmlMutableString.mutationsCount += 1
        return HtmlMutableString(string: data)
    }
    
    override func isEqual(_ object: Any?) -> Bool {
        guard let object = object as? HtmlMutableString else { return false }
        return data == object.data
    }
}

struct HtmlString: CustomDebugStringConvertible, ExpressibleByStringLiteral, Equatable {
    
    var debugDescription: String {
        data.description
    }
    
    private var data = HtmlMutableString()
    
    public init(stringLiteral value: String) {
        data = HtmlMutableString(string: value)
    }
    
    init(_ data: HtmlMutableString) {
        self.data = data
    }
    
    mutating func append(_ param: HtmlMutableString) {
        if !isKnownUniquelyReferenced(&data) {
            data = data.mutableCopy() as! HtmlMutableString
        }
        data.append(param)
    }
    
    static func == (lhs: HtmlString, rhs: HtmlString) -> Bool {
        return lhs.data.data == rhs.data.data
    }
}


class SwiftValueTypeTests: XCTestCase {
    
    var sut: HtmlString!
    
    override func setUp() {
        
    }
    
    func testExample1() {
        var htmlString: HtmlString = "<strong>Sample Title</strong>"
        
        // should print "<strong>Sample Title</strong>"
        print("value type: 1 ", String(describing: htmlString))
        
        let otherHtmlString: HtmlString = "<strong>Sample Title</strong>"
        // true
        print("value type: 2 ", otherHtmlString == htmlString)
        
        // printing htmlString should look like this: "<strong>Samlpe Title</strong><p>some paragraph</p>"
        htmlString.append(HtmlMutableString(string: "<p>some paragraph</p>"))
        print("value type: 3 ", htmlString)
//        print("value type: ", mutate)
        
        var newHtmlString = htmlString
        newHtmlString.append(HtmlMutableString(string: "<p>new some paragraph</p>"))
//        newHtmlString.
        print("value type: 4 ", htmlString)
        print("value type: 5 ", newHtmlString)
    }
}
