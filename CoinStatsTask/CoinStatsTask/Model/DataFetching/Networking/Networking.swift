//
//  Networking.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation
import RxSwift

typealias Response = (Data?, URLResponse?)

protocol Networking {
    func fetchData(from routing: Routing) -> Single<Response>
}
