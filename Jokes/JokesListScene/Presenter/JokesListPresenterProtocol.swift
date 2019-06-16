//
//  JokesListPresenterProtocol.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol JokesListPresenterProtocol: class {

    func onUserSelectedJokesCount(_ count: Int)
    func jokesCount() -> Int
    func jokeAtIndex(index: Int) -> String
}
