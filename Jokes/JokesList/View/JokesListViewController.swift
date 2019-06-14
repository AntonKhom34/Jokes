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

    // MARK: - Outlets

    @IBOutlet weak var jokesCount: UITextField!
    @IBOutlet weak var tableView: UITableView!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }

    // MARK: - setup

    func setupTableView() {
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
    }

    // MARK: - Events

    @IBAction func taped(_ sender: Any) {
        if jokesCount.text != nil {
            presenter.loadJokes(jokesCount: self.jokesCount.text!)
            jokesCount.text = ""
        }
    }
}

// MARK: - JokesListViewProtocol

extension JokesListViewController: JokesListViewProtocol {
    func reloadTable() {
        tableView.reloadData()
    }
}

// MARK: - UITableViewDataSource

extension JokesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.jokesCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()

        cell.textLabel?.text = presenter.jokeAtIndex(index: indexPath.row)

        return cell
    }

}
