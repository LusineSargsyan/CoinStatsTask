//
//  TableViewModeling.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import UIKit
import RxSwift
import RxRelay

protocol TableViewModeling {
    associatedtype CellModel

    var dataSource: BehaviorRelay<[CellModel]> { get }
    var estimatedRowHeight: CGFloat { get }
    var rowHeight: CGFloat { get }
    var dataSourceTableView: UITableViewDataSource? { get }
    var delegate: UITableViewDelegate? { get }
    var showsVerticalScrollIndicator: Bool { get }
    var style: UITableView.Style { get }
    var separatorStyle: UITableViewCell.SeparatorStyle { get }
    var tableContentInsets: UIEdgeInsets { get }
    var error: BehaviorRelay<Error?> { get }

}

extension TableViewModeling {
    var estimatedRowHeight: CGFloat { return 70 }
    var rowHeight: CGFloat { return UITableView.automaticDimension }
    var dataSourceTableView: UITableViewDataSource? { return nil }
    var delegate: UITableViewDelegate? { return nil }
    var showsVerticalScrollIndicator: Bool { return false }
    var style: UITableView.Style { return .plain }
    var separatorStyle: UITableViewCell.SeparatorStyle { return .none }
    var tableContentInsets: UIEdgeInsets { return .zero }
}
