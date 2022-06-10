//
//  DataFetchProvider.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import Foundation

enum DataFetchProvider {
    static var `default`: DataFetching {
        let networkManager = NetworkManager()
        let parser = JSONParser()
        let validator = ResponseValidator()
        let manager = DataFetchManager(networkManager: networkManager,
                                       parser: parser,
                                       validator: validator)

        return manager
    }
}
