//
//  JSONParser.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation

struct JSONParser: Parsing {
    func parse<T: Decodable>(data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            let genericError = GenericError.parsingFailed(error: error)
            print(String(reflecting: genericError))

            throw genericError
        }
    }
}
