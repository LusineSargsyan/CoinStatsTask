//
//  ServiceProvider.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import Foundation

enum ServiceProvider {
    static var coinList: CoinListServicing {
        return CoinListWebService(dataFetchManager: DataFetchProvider.default)
    }

    static var coinsInfo: CoinsInfoServicing {
        return CoinsInfoWebService(dataFetchManager: DataFetchProvider.default)
    }
}
