//
//  DataFetching.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation
import RxSwift

protocol DataFetching {
    init(networkManager: Networking, parser: Parsing, validator: ResponseValidating)
    func fetch<T: Decodable>(from routing: Routing) -> Single<T>
}
