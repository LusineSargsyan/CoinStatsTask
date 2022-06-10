//
//  CoinsListTableViewController.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import Foundation

final class CoinsListTableViewController: BaseTableViewController<CoinsListTableViewModel, CoinCell> {
    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.fetchData()
    }

    override func handleDataSource(dataSource: [CoinTableViewCellModel]) {
        super.handleDataSource(dataSource: dataSource)

        viewModel.fetchUpdatedInfo()
    }
}
