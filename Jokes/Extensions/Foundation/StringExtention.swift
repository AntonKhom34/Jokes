//
//  StringExtention.swift
//  Jokes
//
//  Created by Антон Хомяков on 14/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

extension String {
    func localize() -> String {
        let localizebleString = NSLocalizedString(self, comment: "")
        return localizebleString
    }
}
