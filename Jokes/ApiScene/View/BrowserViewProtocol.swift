//
//  BrowserViewProtocol.swift
//  Jokes
//
//  Created by Антон Хомяков on 14/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import Foundation

protocol BrowserViewProtocol: class {

    func startPreloader()
    func stopPreloader()
    func navigateToUrl(_ utl: URL)
}
