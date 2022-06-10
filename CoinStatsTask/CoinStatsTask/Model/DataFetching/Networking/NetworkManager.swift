//
//  DataFetchManager.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation
import RxSwift

struct NetworkManager: Networking {
    func fetchData(from routing: Routing) -> Single<Response> {
        return Single.create { observer in
            var request: URLRequest

            do {
                request = try routing.createURLRequest()
                URLSession.shared
                    .dataTask(with: request) { data, response, error in
                        guard error == nil else {
                            let genericError = GenericError.requestFailed(error: error!)

                            print(String(reflecting: genericError))
                            observer(.failure(genericError))

                            return
                        }

                        observer(.success((data, response)))
                    }.resume()
            } catch {
                let genericError = GenericError.requestFailed(error: error)

                print(String(reflecting: genericError))
                observer(.failure(genericError))
            }

            return Disposables.create()
        }
    }
}
