//
//  Routing.swift
//  CoinStatsTask
//
//  Created by Lusine on 07.06.22.
//

import Foundation

typealias RequestParameter = [String: Any]
typealias RequestHeader = [String: String]

protocol Routing {
    var baseURL: URL { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: RequestParameter { get }
    var headers: RequestHeader { get }
    var encoder: ParameterEncoding { get }
    var statusCode: Set<Int> { get }

    func createURLRequest() throws -> URLRequest
}

extension Routing {
    var baseURL: URL {
        guard let url = URL(string: Constants.baseURL) else { preconditionFailure("URL can't be created with \(Constants.baseURL)") }

        return url
    }
    var method: HTTPMethod { return .GET }
    var parameters: RequestParameter { return [:] }
    var headers: RequestHeader { return [:] }
    var encoder: ParameterEncoding { return ParameterURLEncoder() }
    var statusCode: Set<Int> { return Set<Int>([200]) }

    func createURLRequest() throws -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)

        do {
            try encoder.encode(parameters, in: &request)
        }

        request.httpMethod = method.rawValue
        headers.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }

        return request
    }
}
