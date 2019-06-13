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
    
    static func makeJokesListViewController() -> UIViewController {
        
        let view = JokesListViewController()
        let presenter = JokesListPresenter(view: view,
                                            provider: JokesListProvider(service: ApiServies()))
        view.presenter = presenter
        
        return view
    }
}
