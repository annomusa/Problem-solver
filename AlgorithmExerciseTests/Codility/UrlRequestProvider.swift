//
//  UrlRequestProviderTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

struct MovieRate: Codable {
    let movieId: String
    let rate: Int
}

enum ApiEndpoint {
    case getMovies(userId: String)
    case postRate(movieRate: MovieRate)

    var endpointString: String {
        switch self {
        case .getMovies:
            return "/fetchMovies"
        case .postRate:
            return "/postRate"
        }
    }
}

protocol TokenProvider {
    var token: String { get }
}

class RequestsProvider {
    private let baseURL: URL
    private let tokenProvider: TokenProvider
    
    init?(baseURLString: String, tokenProvider: TokenProvider) {
        guard let baseURL = URL(string: baseURLString) else { return nil }
        
        self.baseURL = baseURL
        self.tokenProvider = tokenProvider
    }
    
    func createRequestFor(for endpoint: ApiEndpoint) -> URLRequest? {
        
        switch endpoint {
        case .getMovies(let userId):
            let getMoviesURL = baseURL.appendingPathComponent(endpoint.endpointString)
            var urlComponents = URLComponents(url: getMoviesURL, resolvingAgainstBaseURL: true)
            let query: [String: String] = ["userId": userId]
            urlComponents?.queryItems = []
            urlComponents?.queryItems?.append(URLQueryItem(name: "userId", value: "\(userId)"))
            
            var request = URLRequest(url: (urlComponents?.url)!)
            request.httpMethod = "GET"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("\(tokenProvider.token)", forHTTPHeaderField: "Authorization")
            request.timeoutInterval = 30
            return request
        case .postRate(let rate):
            let postRateMovieURL = baseURL.appendingPathComponent(endpoint.endpointString)
            
            var request = URLRequest(url: postRateMovieURL)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Accept")
            request.setValue("\(tokenProvider.token)", forHTTPHeaderField: "Authorization")
            request.timeoutInterval = 30
            
            do {
                let jsonReq = try JSONEncoder().encode(rate)
                request.httpBody = jsonReq
            } catch {
                return nil
            }
            return request
        }
    }
}

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
