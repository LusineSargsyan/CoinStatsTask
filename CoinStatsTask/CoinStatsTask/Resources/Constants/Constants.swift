//
//  Constants.swift
//  CoinStatsTask
//
//  Created by Lusine on 07.06.22.
//

import Foundation

enum Constants {
    static let baseURL: String = "https://api.coin-stats.com"
    static let ok: String = "Ok"
    static let titleError: String = "Error"
}

extension Constants {
    enum Paths: String {
        case coinsList = "/v3/coins"
        case coins = "?responseType=array"
    }
}

extension Constants {
    enum Errors {
        static let notStringCompatibleValue: String = "Value is not compeatible for converting to String"
        static let emptyData: String = "Data is empty"
        static let notSuccessStatusCode: String = "Therre is no success status code"
        static let somthingWrong: String = "Something wents wrong"
    }
}

extension Constants {
    enum Response {
        static let identifier: Int = 0
        static let percenrPerDay: Int = 7
        static let price: Int = 2
    }
}
