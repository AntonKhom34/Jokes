//
//  ViewControllersFactory.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class ViewControllersFactory {

    // MARK: - JokesList

    static func makeTabBarViewController() -> UIViewController {
        let appearanceConfig = AppearanceConfig()
        let categoriesTabBarController = UITabBarController()

        let jokesListViewController = makeJokesListViewController(appearanceConfig: appearanceConfig)
        jokesListViewController.tabBarItem = makeJokesTabBarItem()

        let apiRulesViewController = makeApiRulesViewController()
        apiRulesViewController.tabBarItem = makeApiRulesTabBarItem()

        let viewControllers = [jokesListViewController, apiRulesViewController]
        categoriesTabBarController.setViewControllers(viewControllers, animated: true)

        return categoriesTabBarController
    }

    // MARK: - Private

    private static func makeJokesListViewController(appearanceConfig: AppearanceConfigProtocol) -> UIViewController {
        let view = JokesListViewController()
        let presenter = JokesListPresenter(view: view,
        provider: JokesListProvider(service: ApiServies()))
        view.presenter = presenter
        view.appearanceConfig = appearanceConfig

        return UINavigationController(rootViewController: view)
    }

    private static func makeApiRulesViewController() -> UIViewController {
        let view = BrowserViewController()
        let presenter = BrowserPresenter(view: view)
        view.presenter = presenter

        return UINavigationController(rootViewController: view)
    }

    private static func makeJokesTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "TabBarItem_Jokes".localize(), image: UIImage(named: "TabBar_RingOne"), tag: 0)
    }

    private static func makeApiRulesTabBarItem() -> UITabBarItem {
        return UITabBarItem(title: "TabBarItem_API".localize(), image: UIImage(named: "TabBar_RingTwo"), tag: 0)
    }
}
