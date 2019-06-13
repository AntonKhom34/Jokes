//
//  JokesListViewController.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class JokesListViewController: UIViewController {
    var presenter: JokesListPresenterProtocol!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: - JokesListViewProtocol

extension JokesListViewController: JokesListViewProtocol {
}
