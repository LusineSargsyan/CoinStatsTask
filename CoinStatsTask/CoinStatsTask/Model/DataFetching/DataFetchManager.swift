//
//  DataFetchManager.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation
import RxSwift

struct DataFetchManager: DataFetching {
    private let networkManager: Networking
    private let parser: Parsing
    private let validator: ResponseValidating

    init(networkManager: Networking,
         parser: Parsing,
         validator: ResponseValidating) {
        self.networkManager = networkManager
        self.parser = parser
        self.validator = validator
    }

    func fetch<T: Decodable>(from routing: Routing) -> Single<T> {
        return Single.create { observer in
            networkManager.fetchData(from: routing).subscribe { response in
                do {
                    let validatedData = try validator.validate(response: response, with: routing)
                    let parsedData: T = try parser.parse(data: validatedData)

                    observer(.success(parsedData))
                } catch {
                    observer(.failure(error))
                }
            } onFailure: { error in
                observer(.failure(error))
            }
        }
    }

}
