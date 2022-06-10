//
//  ResponseValidating.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation

protocol ResponseValidating {
    func validate(response: Response, with routing: Routing) throws -> Data
}
