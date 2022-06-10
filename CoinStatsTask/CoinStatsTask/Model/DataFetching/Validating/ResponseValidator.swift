//
//  ResponseValidator.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation

struct ResponseValidator: ResponseValidating {
    func validate(response: Response, with routing: Routing) throws -> Data {
        var genericError: GenericError?

        defer {
            if let genericError = genericError {
                print(String(reflecting: genericError))
            }
        }

        guard let data = response.0, !data.isEmpty else {
            genericError = GenericError.emptyData
            throw genericError!
        }
        guard let response = response.1 as? HTTPURLResponse, routing.statusCode.contains(response.statusCode) else {
            genericError = GenericError.notSuccessStatusCode
            throw genericError!
        }

        return data
    }
}
