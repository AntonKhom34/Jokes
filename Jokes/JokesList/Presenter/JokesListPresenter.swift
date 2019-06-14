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
    func loadJokes(jokesCount: String) {
        provider.getJokes(jokesCount: jokesCount) { [weak self] jokes in
            guard let strongSelf = self else {
                return
            }
            strongSelf.jokes = jokes
            /*strongSelf.jokes.append(contentsOf: jokes)
                            Если нужно дополнить таблицу шутками */
            strongSelf.view.reloadTable()
        }
    }

    func jokesCount() -> Int {
        return jokes.count
    }

    func jokeAtIndex(index: Int) -> String {
        return jokes[index].joke
    }
}
