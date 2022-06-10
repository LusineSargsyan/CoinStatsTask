//
//  Service.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation
import RxSwift

class Service {
   private let dataFetchManager: DataFetching

    init(dataFetchManager: DataFetching) {
        self.dataFetchManager = dataFetchManager
    }

    func fetch<T: Decodable>(with routing: Routing) -> Single<T> {
        return dataFetchManager.fetch(from: routing)
    }
}
