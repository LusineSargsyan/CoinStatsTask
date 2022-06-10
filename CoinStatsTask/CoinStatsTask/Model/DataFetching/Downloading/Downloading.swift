//
//  Downloading.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import Foundation
import RxSwift

protocol Downloading {
    func download(from url: URL) -> Single<Data>
    func cancel(for url: URL)
}
