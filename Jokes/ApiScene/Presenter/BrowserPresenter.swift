//
//  BrowserPresenter.swift
//  Jokes
//
//  Created by Антон Хомяков on 14/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class BrowserPresenter {

    private let apiURL = "http://www.icndb.com/api/"

    unowned var view: BrowserViewProtocol

    init(view: BrowserViewProtocol) {
        self.view = view
    }
}

// MARK: - BrowserPresenterProtocol

extension BrowserPresenter: BrowserPresenterProtocol {

    func onViewDidApear() {
        guard let myURL = URL(string: apiURL) else {
            fatalError("Could not converted apiURL: \(apiURL) to URL")
        }
        view.startPreloader()
        view.navigateToUrl(myURL)
    }

    func onLoadingFinished() {
        view.stopPreloader()
    }
}
