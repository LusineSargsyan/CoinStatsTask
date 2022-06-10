//
//  ParameterJSONEncoder.swift
//  CoinStatsTask
//
//  Created by Lusine on 07.06.22.
//

import Foundation

struct ParameterJSONEncoder: ParameterEncoding {
    func encode(_ parameters: RequestParameter, in request: inout URLRequest) throws {
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)

            request.httpBody = data
        } catch {
            let genericError = GenericError.serializationFailed(error: error)
            print(String(reflecting: genericError))

            throw genericError
        }
    }
}
