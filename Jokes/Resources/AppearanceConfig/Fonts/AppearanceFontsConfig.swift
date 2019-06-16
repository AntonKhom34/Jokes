//
//  AppearanceFontsConfig.swift
//  Jokes
//
//  Created by Антон Хомяков on 15/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class AppearanceFontsConfig: AppearanceFontsConfigProtocol {

    static private let regularFontName = "Roboto-Regular"
    static private let buttonFontName = "Roboto-Medium"
    static private let mainFontSize: CGFloat = 10

    private static func regularFont() -> UIFont {
        guard let font = UIFont(name: regularFontName, size: mainFontSize) else {
            fatalError("Could not get font with name \(regularFontName)")
        }
        return font
    }

    private static func buttonFont() -> UIFont {
        guard let font = UIFont(name: buttonFontName, size: mainFontSize) else {
            fatalError("Could not get font with name \(buttonFontName)")
        }
        return font
    }

    // MARK: - AppearanceConfigProtocol

    let jokeTextFont = AppearanceFontsConfig.regularFont().withSize(17)

    let buttonTextFont = AppearanceFontsConfig.buttonFont().withSize(15)
}
