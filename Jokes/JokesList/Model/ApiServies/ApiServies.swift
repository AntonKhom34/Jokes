//
//  ApiServies.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class ApiServies {
    private let apiUrl = ""
}

// MARK: - ApiServiesProtocol

extension ApiServies: ApiServiesProtocol {
    func getJokes(jokesCount: String, onComplete: @escaping ([JokesResult]) -> Void) {
        let urlString = getURLString() + jokesCount
        guard let url = URL(string: urlString) else {
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let _ = error {
                DispatchQueue.main.async {
                    onComplete([])
                }
                return
            }

            guard let data = data else {
                DispatchQueue.main.async {
                    onComplete([])
                }
                return
            }

            do {
                let dataResult = try JSONDecoder().decode(DataResult.self, from: data)
                DispatchQueue.main.async {
                    onComplete(dataResult.jokes)
                }
            } catch {
                DispatchQueue.main.async {
                    onComplete([])
                }
            }
        }
        task.resume()
    }

    // MARK: - Private

    func getURLString() -> String {
        let urlString = "http://api.icndb.com/jokes/random/"

        return urlString
    }

}
