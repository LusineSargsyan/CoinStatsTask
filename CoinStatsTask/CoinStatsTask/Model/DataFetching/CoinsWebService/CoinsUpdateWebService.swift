//
//  CoinsUpdateWebService.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation
import RxSwift

struct CoinsInfoWebServiceParameter: Routing {
    var path: String { return "\(Constants.Paths.coinsList.rawValue)\(Constants.Paths.coins.rawValue)" }
}

protocol CoinsInfoServicing {
    func call(with params: CoinsInfoWebServiceParameter) -> Single<CoinsResponse>
}

final class CoinsInfoWebService: Service, CoinsInfoServicing {
    func call(with params: CoinsInfoWebServiceParameter) -> Single<CoinsResponse> {
        return self.fetch(with: params)
    }
}
