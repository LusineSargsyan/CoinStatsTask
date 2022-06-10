//
//  CoinListResponse.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation

struct CoinListResponse: Decodable {
    let coins: [Coin]
}

struct Coin: Decodable {
    let identifier: String
    let rank: Int
    let usdPrice: Double?
    let btcPrice: Double?
    let usdVolume: Double?
    let name: String
    let symbol: String
    let iconURL: String
    let marketCup: Int
    let percentChange1H: Double?
    let percntChange24H: Double?
    let percntChange7D: Double?

    private enum CodingKeys: String, CodingKey {
        case identifier = "i"
        case rank = "r"
        case usdPrice = "pu"
        case btcPrice = "pb"
        case usdVolume = "v"
        case name = "n"
        case symbol = "s"
        case iconURL = "ic"
        case marketCup = "m"
        case percentChange1H = "p1"
        case percntChange24H = "p24"
        case percntChange7D = "p7"
    }
}
