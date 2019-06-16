//
//  AppearanceConfigProtocol.swift
//  Jokes
//
//  Created by Антон Хомяков on 15/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol AppearanceConfigProtocol {
    var fonts: AppearanceFontsConfigProtocol { get }
    var colors: AppearanceColorsConfigProtocol { get }
}
