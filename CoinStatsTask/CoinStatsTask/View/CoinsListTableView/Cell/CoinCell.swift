//
//  CoinCell.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import UIKit
import RxSwift

final class CoinCell: UITableViewCell, Setupable {
    typealias Model = CoinTableViewCellModel

    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var percentContainerView: UIView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var iconImageView: UIImageView!
    @IBOutlet private weak var rankLabel: UILabel!
    @IBOutlet private weak var symbolLabel: UILabel!
    private var pricePercentChangeView: PricePercentChangeView?
    private var model: CoinTableViewCellModel?
    private var disposeBag: DisposeBag = DisposeBag()

    override func awakeFromNib() {
        super.awakeFromNib()

        self.backgroundColor = Colors.backGround
        self.rankLabel.backgroundColor = Colors.rankBackground

        addPricePercentView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.iconImageView.image = UIImage(named: "coins")
        model?.cancelDownloading()
        disposeBag = DisposeBag()
    }

    func setup(with model: CoinTableViewCellModel) {
        nameLabel.text = model.name
        rankLabel.text = model.rank
        symbolLabel.text = model.symbol
        self.model = model

        model.updateInfoValue.subscribe { [weak self]  (percent, price) in
            self?.pricePercentChangeView?.setup(with: PricePercentChangeViewModel(percent: percent))
            self?.priceLabel.text = price
        }
        .disposed(by: disposeBag)

        model.download()
            .observe(on: MainScheduler.instance)
            .subscribe(onSuccess: { [weak self] image in
                self?.iconImageView.image = image
            }, onFailure: { [weak self] _ in
                self?.iconImageView.image = UIImage(named: "coins")
            })
            .disposed(by: disposeBag)
    }

    private func addPricePercentView() {
        let view = PricePercentChangeView.loadFromNib()

        view.translatesAutoresizingMaskIntoConstraints = false
        percentContainerView.addSubview(view)
        view.addBorderConstraints()
        pricePercentChangeView = view
    }

}

extension UIView {
    static func loadFromNib() -> Self {
        let bundle = Bundle(for: Self.self)
        let loadedNibFirst = bundle.loadNibNamed(String(describing: Self.self), owner: nil, options: nil)?.first

        guard let view = loadedNibFirst as? Self else { preconditionFailure("View is not loaded or has wrong type") }

        return view
    }
}
