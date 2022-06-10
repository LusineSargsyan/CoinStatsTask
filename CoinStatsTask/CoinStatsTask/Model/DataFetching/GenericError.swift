//
//  EncodingError.swift
//  CoinStatsTask
//
//  Created by Lusine on 07.06.22.
//

import Foundation

enum GenericError: Error, CustomDebugStringConvertible {

    // Encoding errors
    case serializationFailed(error: Error)
    case notStringCompatibleValue

    // Networking errors
    case requestFailed(error: Error)
    case emptyData
    case notSuccessStatusCode

    // Parse errors
    case parsingFailed(error: Error)

    // General error
    case somthingWrong

    var debugDescription: String {
        var errorDescription = ""

        switch self {
        case .serializationFailed(let error):
            errorDescription = "serializationFailed: \(String(reflecting: error))"
        case .notStringCompatibleValue:
            errorDescription = Constants.Errors.notStringCompatibleValue
        case .requestFailed(let error):
            errorDescription = "requestFailed: \(String(reflecting: error))"
        case .emptyData:
            errorDescription = Constants.Errors.emptyData
        case .notSuccessStatusCode:
            errorDescription = Constants.Errors.notSuccessStatusCode
        case .parsingFailed(let error):
            errorDescription = "parsingFailed: \(String(reflecting: error))"
        case .somthingWrong:
            errorDescription = Constants.Errors.somthingWrong
        }

        return errorDescription
    }

}
