//
//  DownloadManager.swift
//  CoinStatsTask
//
//  Created by Lusine on 09.06.22.
//

import Foundation
import RxSwift

final class DownloadManager: Downloading {
    private var pendingDataTask: [URL: URLSessionDataTask] = [:]

    func download(from url: URL) -> Single<Data> {
        return Single.create { [weak self] obserever in
          let dataTask = URLSession.shared.dataTask(with: url) { data, _, error in
                guard error == nil else {
                    obserever(.failure(error!))

                    return
                }
                if let data = data, !data.isEmpty {
                    obserever(.success(data))
                } else {
                    let error = GenericError.emptyData

                    obserever(.failure(error))
                    print(String(reflecting: error))
                }
            }

            self?.pendingDataTask[url] = dataTask
            dataTask.resume()

            return Disposables.create()
        }
    }

    func cancel(for url: URL) {
        pendingDataTask[url]?.cancel()
        pendingDataTask[url] = nil
    }

}
