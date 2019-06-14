//
//  JokesListProviderProtocol.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol JokesListProviderProtocol {
    func getJokes(jokesCount: String, onComplete: @escaping ([JokesResult]) -> Void)
}
