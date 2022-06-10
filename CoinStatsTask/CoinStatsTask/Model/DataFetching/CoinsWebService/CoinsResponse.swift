//
//  CoinsResponse.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation

struct CoinsResponse: Decodable {
    let coins: [[CoinUpdateResponse]]
}

enum CoinUpdateResponse: Decodable {
    case string(string: String)
    case int(int: Int)
    case bool(bool: Bool)
    case double(double: Double)
    case unknown

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()

        if let value = try? container.decode(Bool.self) {
            self = .bool(bool: value)
        } else if let value = try? container.decode(Int.self) {
            self = .int(int: value)
        } else if let value = try? container.decode(String.self) {
            self = .string(string: value)
        } else if let value = try? container.decode(Double.self) {
            self = .double(double: value)
        } else {
            self = .unknown
        }
    }

    var stringValue: String? {
        switch self {
        case .string(let value):
            return value
        default:
            return nil
        }
    }

    var boolValue: Bool? {
        switch self {
        case .bool(let value):
            return value
        default:
            return nil
        }
    }

    var doubleValue: Double? {
        switch self {
        case .double(let value):
            return value
        case .int(let value):
            return Double(value)
        case .string(let value):
            return Double(value)
        default:
            return nil
        }
    }

    var intValue: Int? {
        switch self {
        case .int(let value):
            return value
        default:
            return nil
        }
    }

}
