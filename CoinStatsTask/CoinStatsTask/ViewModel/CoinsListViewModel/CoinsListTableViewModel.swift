//
//  CoinsListTableViewModel.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import Foundation
import RxSwift
import RxRelay

final class CoinsListTableViewModel: BaseTableViewModel<CoinTableViewCellModel, CoinListViewModelInputs> {
    func fetchData() {
        inputs.service.call(with: CoinListParameters()).subscribe { [weak self] response in
            guard let self = self else { return }

            let cellModels = response.coins.map { CoinTableViewCellModel(coin: $0, downloadManager: self.inputs.downloadManager) }

            self.dataSource.accept(cellModels)
        } onFailure: { [weak self] error in
            self?.error.accept(error)
        }
        .disposed(by: disposeBag)

        self.fetchUpdatedInfo()
    }

    func fetchUpdatedInfo() {
        Timer.scheduledTimer(withTimeInterval: 5, repeats: true) { [weak self] _ in
            guard let self = self else { return }

            self.inputs.coinInfoservice.call(with: CoinsInfoWebServiceParameter())
                .observe(on: MainScheduler.instance)
                .subscribe { [weak self] response in
                    response.coins.forEach { coinInfo in
                        if let index = self?.dataSource.value.firstIndex(where: { $0.identifier == coinInfo[Constants.Response.identifier].stringValue ?? "" }) {
                            let percentPerDay = coinInfo[Constants.Response.percenrPerDay].doubleValue ?? 0.0
                            let price = "$\(coinInfo[Constants.Response.price].doubleValue ?? 0.0)"
                            self?.dataSource.value[index].updateInfoValue.accept((percentPerDay, price))
                        }
                    }
                }
                .disposed(by: self.disposeBag)
        }
    }
}
