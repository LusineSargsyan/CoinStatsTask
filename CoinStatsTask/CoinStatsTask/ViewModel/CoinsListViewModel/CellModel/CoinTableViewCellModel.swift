//
//  CoinTableViewCellModel.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import UIKit
import RxSwift
import RxRelay

typealias UpdatedInfo = (percentPerDay: Double, price: String)

final class CoinTableViewCellModel  {
    let identifier: String
    let name: String
    let symbol: String
    let iconURLString: String
    let rank: String
    let usdPrice: String
    var updateInfoValue: BehaviorRelay<UpdatedInfo> = BehaviorRelay<UpdatedInfo>(value: (0.0, ""))

    private let downloadManager: Downloading

    init(coin: Coin, downloadManager: Downloading) {
        self.identifier = coin.identifier
        self.name = coin.name
        self.symbol = coin.symbol
        self.iconURLString = coin.iconURL
        self.rank = "\(coin.rank)"
        self.usdPrice = "$\(String(describing: coin.usdPrice ?? 0))"
        self.updateInfoValue.accept((percentPerDay: coin.percntChange24H ?? 0.0, price: "$\(String(describing: coin.usdPrice ?? 0))"))
        self.downloadManager = downloadManager
    }

    func download() -> Single<UIImage> {
        let defaultImage = UIImage(named: "coins") ?? UIImage()

        guard let url = URL(string: iconURLString) else {
            return Single.just(defaultImage)
        }

        return downloadManager.download(from: url).flatMap {
            guard let image = UIImage(data: $0) else { return Single.just(defaultImage) }

            return Single.just(image)
        }
    }

    func cancelDownloading() {
        guard let url = URL(string: iconURLString) else { return }

        downloadManager.cancel(for: url)
    }
}
