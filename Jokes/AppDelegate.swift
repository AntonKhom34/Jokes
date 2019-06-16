//
//  AppDelegate.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let window = UIWindow(frame: UIScreen.main.bounds)
        self.window = window

        window.rootViewController = ViewControllersFactory.makeTabBarViewController()
        window.makeKeyAndVisible()

        // MARK: - IQKeyboardManager

        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true

        return true
    }
}
