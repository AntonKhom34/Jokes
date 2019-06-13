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
        let categoriesTabBarController = UITabBarController()

        let jokesListViewController = makeJokesListViewController()
        jokesListViewController.tabBarItem = UITabBarItem(title: "Jokes",
                                                          image: UIImage.init(named: "RingOne"),
                                                          tag: 0)

        let apiRulesViewController = makeApiRulesViewController()
        apiRulesViewController.tabBarItem = UITabBarItem(title: "API",
                                                           image: UIImage.init(named: "RingTwo"),
                                                           tag: 0)

        let viewControllers = [jokesListViewController, apiRulesViewController]
        categoriesTabBarController.setViewControllers(viewControllers, animated: true)

        return categoriesTabBarController
    }

    // MARK: - Private

    private static func makeJokesListViewController() -> UIViewController {
        let view = JokesListViewController()
        let presenter = JokesListPresenter(view: view,
        provider: JokesListProvider(service: ApiServies()))
        view.presenter = presenter

        return view
    }

    private static func makeApiRulesViewController() -> UIViewController {
        return UIViewController()
    }
}
