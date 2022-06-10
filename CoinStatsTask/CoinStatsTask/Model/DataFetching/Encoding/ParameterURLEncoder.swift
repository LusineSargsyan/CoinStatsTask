//
//  ParameterURLEncoder.swift
//  CoinStatsTask
//
//  Created by Lusine on 07.06.22.
//

import Foundation

struct ParameterURLEncoder: ParameterEncoding {
    func encode(_ parameters: RequestParameter, in request: inout URLRequest) throws {
        guard let url = try createURL(parameters, in: &request) else { return }

        request.url = url
    }

    private func createURL(_ parameters: RequestParameter, in request: inout URLRequest) throws -> URL? {
        guard !parameters.isEmpty, var urlComponents = URLComponents(string: request.url?.absoluteString ?? "") else { return request.url }

        let queryItems: [URLQueryItem] = try parameters.map {
            let value = $0.value
            var resultValue = ""

            if let values = value as? [CustomStringConvertible] {
                resultValue = values.reduce("", { result, item in
                    return "\(result)\(String(describing: item)),"
                })
                resultValue.removeLast()
            } else if let value = value as? CustomStringConvertible {
                resultValue = String(describing: value)
            } else {
                let genericError = GenericError.notStringCompatibleValue
                print(String(reflecting: genericError))

                throw genericError
            }

            return URLQueryItem(name: $0.key, value: resultValue)
        }
        urlComponents.queryItems = queryItems

        return urlComponents.url ?? nil
    }

}
