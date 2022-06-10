//
//  ParameterEncoding.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import Foundation

protocol ParameterEncoding {
    func encode(_ parameters: RequestParameter, in request: inout URLRequest) throws
}
