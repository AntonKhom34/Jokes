//
//  JokesListPresenter.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class JokesListPresenter {
    var jokes: [JokesResult]

    unowned var view: JokesListViewProtocol
    private var provider: JokesListProviderProtocol

    init(view: JokesListViewProtocol,
         provider: JokesListProviderProtocol) {
        self.view = view
        self.provider = provider
        jokes = []
    }
}

// MARK: - JokesListPresenterProtocol

extension JokesListPresenter: JokesListPresenterProtocol {
    func onUserSelectedJokesCount(_ count: Int) {
        showJokesWithCount(count)
    }

    func jokesCount() -> Int {
        return jokes.count
    }

    func jokeAtIndex(index: Int) -> String {
        guard 0 <= index && index < jokes.count else {
            fatalError("could not get joke with index: \(index)")
        }
        return jokes[index].joke
    }

    // MARK: - Private

    private func showJokesWithCount(_ count: Int) {
        view.startPreloader()
        provider.getJokesWithCount(jokesCount: count) { [weak self] jokes in
            guard let strongSelf = self else {
                return
            }
            strongSelf.view.stopPreloader()
            strongSelf.jokes = jokes
            strongSelf.view.reloadTable()
        }
    }
}
