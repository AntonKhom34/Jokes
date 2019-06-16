//
//  ApiServies.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class ApiServies {
    private let apiUrl = "http://api.icndb.com/jokes/random/"
}

// MARK: - ApiServiesProtocol

extension ApiServies: ApiServiesProtocol {
    func getJokes(jokesCount: Int, onComplete: @escaping ([JokesResult]) -> Void) {
        URLSession.shared.dataTask(with: getUrlWithJokesCount(jokesCount)) { (data, _, error) in
            guard let data = data, error == nil else {
                onComplete([])
                return
            }

            do {
                let dataResult = try JSONDecoder().decode(DataResult.self, from: data)
                onComplete(dataResult.jokes)
            } catch {
                onComplete([])
            }
        }.resume()
    }

    // MARK: - Private

    private func getUrlWithJokesCount(_ jokesCount: Int) -> URL {
        let urlString = apiUrl + "\(jokesCount)"
        guard let url = URL(string: urlString) else {
            fatalError("Could not converted urlString: \(urlString) to URL")
        }
        return url
    }

}
