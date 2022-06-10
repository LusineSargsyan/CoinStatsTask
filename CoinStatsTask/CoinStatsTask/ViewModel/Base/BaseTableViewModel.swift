//
//  BaseTableViewModel.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import UIKit
import RxSwift
import RxRelay

class BaseTableViewModel<CellModel, Inputs>: TableViewModeling {
    typealias CellModel = CellModel

    var dataSource: BehaviorRelay<[CellModel]> = BehaviorRelay<[CellModel]>(value: [])
    var error: BehaviorRelay<Error?> = BehaviorRelay<Error?>(value: nil)

    let inputs: Inputs
    let disposeBag = DisposeBag()

    init(inputs: Inputs) {
        self.inputs = inputs
    }
}
