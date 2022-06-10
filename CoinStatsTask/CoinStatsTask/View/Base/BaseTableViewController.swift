//
//  BaseTableViewController.swift
//  CoinStatsTask
//
//  Created by Lusine on 08.06.22.
//

import UIKit
import RxSwift
import RxRelay

class BaseTableViewController<ViewModel: TableViewModeling, Cell: UITableViewCell>: UIViewController, UITableViewDelegate, UITableViewDataSource where Cell: Setupable, Cell.Model == ViewModel.CellModel {

    private var tableView: UITableView = UITableView(frame: .zero, style: .plain)
    
    var viewModel: ViewModel!
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        setupTableView()
        bindViewModel()
    }

    func handleDataSource(dataSource: [ViewModel.CellModel]) {
        self.tableView.reloadData()
    }

    func handleError(error: Error) {
        var message: String = String(reflecting: GenericError.somthingWrong)

        if let error = error as? GenericError {
            message = String(reflecting: error)
        }

        self.showAlert(title: Constants.titleError, message: message)
    }

    // MARK: - Private API

    private func setupTableView() {
        tableView.rowHeight =  viewModel.rowHeight
        tableView.estimatedRowHeight = viewModel.estimatedRowHeight
        tableView.dataSource = viewModel.dataSourceTableView ?? self
        tableView.delegate = viewModel.delegate ?? self
        tableView.showsVerticalScrollIndicator = viewModel.showsVerticalScrollIndicator
        tableView.separatorStyle = viewModel.separatorStyle
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.addBorderConstraints()
    }

    private func registerCell() {
        let name = String(describing: Cell.self)
        let nib = UINib(nibName: name, bundle: nil)

        tableView.register(nib, forCellReuseIdentifier: name)
    }

    private func bindViewModel() {
        viewModel.dataSource
            .skip(1)
            .observe(on: MainScheduler.instance)
            .subscribe { [weak self] dataSource in
                self?.handleDataSource(dataSource: dataSource)
            }
            .disposed(by: disposeBag)

        viewModel.error
            .observe(on: MainScheduler.instance)
            .filter { $0 != nil }
            .subscribe(onNext: { [weak self] error in
                self?.handleError(error: error!)
            })
            .disposed(by: disposeBag)
    }

    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: Constants.ok, style: .default))

        self.present(alert, animated: true, completion: nil)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dataSource.value.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: Cell.self), for: indexPath)

        if let cell = cell as? Cell {
            let model = viewModel.dataSource.value[indexPath.row]
            cell.setup(with: model)
        }

        return cell
    }
}
