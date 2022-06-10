//
//  PricePercentChangeView.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import UIKit

enum PriceChangeType: RawRepresentable {
    case negative(value: Double)
    case positive(value: Double)
    case zero

    init(rawValue: Double) {
        if rawValue == 0.0 {
            self = .zero
        } else if rawValue < 0.0 {
            self = .negative(value: rawValue)
        } else {
            self = .positive(value: rawValue)
        }
    }

    var rawValue: Double {
        switch self {
        case .negative(let value), .positive(let value):
            return value
        case .zero:
            return 0.0
        }
    }

    var itemColor: UIColor {
        switch self {
        case .negative:
            return Colors.negativeRed
        case .positive:
            return Colors.positiveGreen
        case .zero:
            return Colors.neitralGray
        }
    }

    var backgroundColor: UIColor {
        return itemColor.withAlphaComponent(0.3)
    }

    var icon: UIImage? {
        switch self {
        case .negative:
            return UIImage(named: "price_down")
        case .positive:
            return UIImage(named: "price_up")
        case .zero:
            return nil
        }
    }
}

struct PricePercentChangeViewModel {
    let percent: String
    let itemColor: UIColor
    let backgrounColor: UIColor
    let icon: UIImage?

    init(percent: Double) {
        let priceChange = PriceChangeType(rawValue: percent)

        self.percent = "\(abs(percent))%"
        self.itemColor = priceChange.itemColor
        self.backgrounColor = priceChange.backgroundColor
        self.icon = priceChange.icon
    }
}

final class PricePercentChangeView: UIView, Setupable {
    typealias Model = PricePercentChangeViewModel

    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var iconLeadingConstraint: NSLayoutConstraint!

    private var model: PricePercentChangeViewModel?

    override func awakeFromNib() {
        super.awakeFromNib()

        self.layer.cornerRadius = 3
        self.layer.masksToBounds = true
    }

    func setup(with model: PricePercentChangeViewModel) {
        self.model = model
        iconImageView.image = model.icon
        titleLabel.text = model.percent
        titleLabel.textColor = model.itemColor
        iconImageView.tintColor = model.itemColor
        backgroundColor = model.backgrounColor
        iconLeadingConstraint.constant = model.icon == nil ? 0 : 5
    }
}
