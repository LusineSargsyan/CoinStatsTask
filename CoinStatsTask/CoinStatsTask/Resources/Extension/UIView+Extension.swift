//
//  UIView+Extension.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import UIKit

extension UIView {
    func addBorderConstraints(edge: UIEdgeInsets = .zero) {
        guard let superView = self.superview else { return }

        NSLayoutConstraint.activate([
            superView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: edge.left),
            superView.topAnchor.constraint(equalTo: self.topAnchor, constant: edge.top),
            self.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: edge.right),
            self.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: edge.bottom)
        ])
    }
}
