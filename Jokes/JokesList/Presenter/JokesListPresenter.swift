//
//  JokesListPresenter.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class JokesListPresenter {
    unowned var view: JokesListViewProtocol
    private var provider: JokesListProviderProtocol

    init(view: JokesListViewProtocol,
         provider: JokesListProviderProtocol) {
        self.view = view
        self.provider = provider
    }
}

// MARK: - JokesListPresenterProtocol

extension JokesListPresenter: JokesListPresenterProtocol {
}
