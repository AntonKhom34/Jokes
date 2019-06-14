//
//  JokesListPresenterProtocol.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol JokesListPresenterProtocol: class {
    func loadJokes(jokesCount: String)
    func jokesCount() -> Int
    func jokeAtIndex(index: Int) -> String
}
