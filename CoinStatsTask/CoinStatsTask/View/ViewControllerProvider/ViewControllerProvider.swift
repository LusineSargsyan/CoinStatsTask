//
//  ViewControllerProvider.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import Foundation

enum ViewControllerProvider {
    static var coinsList: CoinsListTableViewController {
        let viewController = CoinsListTableViewController()
        let downloadManager = DownloadManager()
        let inputs = CoinListViewModelInputs(service: ServiceProvider.coinList,
                                             coinInfoservice: ServiceProvider.coinsInfo,
                                             downloadManager: downloadManager)
        viewController.viewModel = CoinsListTableViewModel(inputs: inputs)

        return viewController
    }
}
