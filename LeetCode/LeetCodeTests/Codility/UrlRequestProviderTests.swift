//
//  UrlRequestProviderTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class UrlRequestProviderTests: XCTestCase {
    
    var sut: RequestsProvider!
    
    override func setUp() {
        sut = RequestsProvider(baseURLString: "https://www.foo.com", tokenProvider: TokenProviderImplementation())
    }
    
    func testExample1() {
        let res = sut.createRequestFor(for: .getMovies(userId: "asdf"))
        print("url request: ", res)
        print("url request: ", res?.url)
        
        let res2 = sut.createRequestFor(for: .postRate(movieRate: MovieRate(movieId: "asdf", rate: 10)))
        print("url request: ", res2)
        print("url request: ", res2?.httpBody)
        do {
            let json = try JSONSerialization.jsonObject(with: res2!.httpBody!, options: .allowFragments)
            let data = try JSONDecoder().decode(MovieRate.self, from: res2!.httpBody!)
            print("url request: ", json)
            print("url request: ", data)
        } catch {
            print(error.localizedDescription)
        }
    }
    
}

class TokenProviderImplementation: TokenProvider {
    var token: String {
        return "asdfkjh3284u"
    }
}
