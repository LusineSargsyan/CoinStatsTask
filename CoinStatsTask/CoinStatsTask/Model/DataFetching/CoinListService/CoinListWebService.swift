//
//  CoinListWebService.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation
import RxSwift

struct CoinListParameters: Routing {
    var path: String { return Constants.Paths.coinsList.rawValue }
}

protocol CoinListServicing {
    func call(with params: CoinListParameters) -> Single<CoinListResponse>
}

final class CoinListWebService: Service, CoinListServicing {
    func call(with params: CoinListParameters) -> Single<CoinListResponse> {
        return self.fetch(with: params)
    }
}
