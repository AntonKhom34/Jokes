//
//  AppearanceConfig.swift
//  Jokes
//
//  Created by Антон Хомяков on 15/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

class AppearanceConfig: AppearanceConfigProtocol {

    // MARK: - AppearanceConfigProtocol

    let fonts: AppearanceFontsConfigProtocol = AppearanceFontsConfig()
    let colors: AppearanceColorsConfigProtocol = AppearanceColorsConfig()
}
