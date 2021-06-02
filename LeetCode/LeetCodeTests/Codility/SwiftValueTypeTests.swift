//
//  SwiftValueTypeTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

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
