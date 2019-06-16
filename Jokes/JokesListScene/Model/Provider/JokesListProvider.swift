//
//  JokesListProvider.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class JokesListProvider {
    private var service: ApiServiesProtocol

    init(service: ApiServiesProtocol) {
        self.service = service
    }

}

// MARK: - JokesListProviderProtocol

extension JokesListProvider: JokesListProviderProtocol {
    func getJokesWithCount(jokesCount: Int, onComplete: @escaping ([JokesResult]) -> Void) {
        service.getJokes(jokesCount: jokesCount, onComplete: { jokes in
            DispatchQueue.main.async {
                onComplete(jokes)
            }
        })
    }
}
