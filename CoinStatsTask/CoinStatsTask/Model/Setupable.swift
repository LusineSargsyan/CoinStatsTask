//
//  Setupable.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation

protocol Setupable {
    associatedtype Model

    func setup(with model: Model)
}
