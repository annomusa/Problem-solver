//
//  CarListTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import LeetCode

class CarListTests: XCTestCase {
    
    func testExample1() {
        do {
            let jsonText1 = try JSONDecoder().decode(Car.self, from: json1)
            print(jsonText1)
        } catch {
            print(error)
        }
    }
    
}

let json1 = """
    {
        "car_manufacturer": "Mercedes",
        "car_model": "W212",
        "wikipedia_link": "https://cars.mercedes.com",
        "price": [
            {
                "value": 500000,
                "currency": "USD",
                "price_time_stamp": "2020-06-20T01:40:00"
            }
        ],
        "dealers": [
            {
                "name": "France-Car-Dealer",
                "country": "France",
                "street": "Street 3",
                "city": "Paris"
            },
            {
                "name": "Poland-Car-Dealer",
                "country": "Poland",
                "street": "Warszawska 3",
                "city": "Warsaw"
            }
        ]
    }
""".data(using: .utf8)!

let json2 = """
{
    "car_manufacturer": "Honda",
    "car_model": "CR-V",
    "wikipedia_link": "https://wikipedia.com/honda",
    "price": [
        {
            "value": 20000,
            "currency": "CHF",
            "price_time_stamp": "2020-12-25T12:40:00"
        },
        {
            "value": 12500,
            "currency": "EUR",
            "price_time_stamp": "2020-01-10T12:40:00"
        }
    ]
}
""".data(using: .utf8)!
