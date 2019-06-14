//
//  DataResult.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

struct DataResult: Codable {
    var jokes: [JokesResult]

    enum CodingKeys: String, CodingKey {
        case jokes = "value"
    }
}
