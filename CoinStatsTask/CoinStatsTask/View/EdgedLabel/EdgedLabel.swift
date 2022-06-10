//
//  EdgedLabel.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import UIKit

final class EdgedLabel: UILabel {
    @IBInspectable var horizontalEdge: CGFloat = 4 {
        didSet {
            layoutIfNeeded()
        }
    }

    @IBInspectable var verticalEdge: CGFloat = 2 {
        didSet {
            layoutIfNeeded()
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    override func drawText(in rect: CGRect) {
        let edgeInstat = UIEdgeInsets(top: verticalEdge, left: horizontalEdge, bottom: verticalEdge, right: horizontalEdge)

        return super.drawText(in: rect.inset(by: edgeInstat))
    }

    override var intrinsicContentSize: CGSize {
        var size = super.intrinsicContentSize

        if text?.isEmpty == false {
            size.height += verticalEdge * 2
            size.width += horizontalEdge * 2
        }

        return size
    }
}
