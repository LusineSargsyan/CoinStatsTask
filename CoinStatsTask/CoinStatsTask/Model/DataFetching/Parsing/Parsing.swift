//
//  Parsing.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation

protocol Parsing {
    func parse<T: Decodable>(data: Data) throws -> T
}
