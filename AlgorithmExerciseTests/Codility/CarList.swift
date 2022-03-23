//
//  CarListTests.swift
//  LeetCodeTests
//
//  Created by Anno Musa on 26/05/21.
//

import Foundation
import XCTest
@testable import AlgorithmExercise

public struct Car {
   let carManufacturer: String
   let model: String
   let wikipediaLink: URL?
   let prices: [Price]
   let dealers: [Dealer]
}

public enum Currency: Equatable {
   case dollar
   case euro
   case unknown
}

public struct Price {
   let value: Double
   let currency: Currency
   let priceTimeStamp: Date?
}

public struct Address: Equatable {
   let city: String
   let street: String
   let country: String
}

public struct Dealer {
   let name: String
   let address: Address
}

// MARK: - Test

extension Car: Decodable {
    enum CodingKeys: String, CodingKey {
        case carManufacturer = "car_manufacturer", model = "car_model", wikipediaLink = "wikipedia_link", prices = "price", dealers = "dealers"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        carManufacturer = try container.decode(String.self, forKey: .carManufacturer)
        model = try container.decode(String.self, forKey: .model)
        wikipediaLink = try container.decode(URL.self, forKey: .wikipediaLink)
        prices = try container.decode([Price].self, forKey: .prices)
        dealers = [] //try container.decode([Dealer].self, forKey: .dealers)
    }
}

extension Currency: Decodable {
    enum CodingKeys: String, CodingKey {
        case currency
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self = try container.decode(Currency.self, forKey: .currency)
    }
}

extension Price: Decodable {
    enum CodingKeys: String, CodingKey {
        case value, currency, priceTimeStamp = "price_time_stamp"
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        value = try container.decode(Double.self, forKey: .value)
        currency = .dollar //try container.decode(Currency.self, forKey: .currency)
        priceTimeStamp = Date()// try container.decode(Date.self, forKey: .priceTimeStamp)
    }
}

extension Address: Decodable {
    enum CodingKeys: String, CodingKey {
        case city, street, country
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        city = try container.decode(String.self, forKey: .city)
        street = try container.decode(String.self, forKey: .street)
        country = try container.decode(String.self, forKey: .country)
    }
}

extension Dealer: Decodable {
    enum CodingKeys: String, CodingKey {
        case name, address
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try container.decode(String.self, forKey: .name)
        
        let container2 = try decoder.container(keyedBy: Address.CodingKeys.self)
        address = try Address(from: decoder)
    }
}

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
