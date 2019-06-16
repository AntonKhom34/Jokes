//
//  JokesListViewController.swift
//  Jokes
//
//  Created by Антон Хомяков on 13/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit
import MBProgressHUD
import IQKeyboardManagerSwift

class JokesListViewController: UIViewController, AppearanceConfigSettable {
    private let cornerRadius: CGFloat = 10

    // MARK: - Properties

    private static let commentCellId = "commentCell"

    var presenter: JokesListPresenterProtocol?
    var appearanceConfig: AppearanceConfigProtocol?

    // MARK: - Outlets

    @IBOutlet private weak var jokesCountTextField: UITextField!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loadButton: UIButton!

    // MARK: - Override

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()

        setupButtonStyle()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationItem.title = "TabBarItem_Title".localize()
    }

    // MARK: - Setup

    func setupTableView() {
        tableView.dataSource = self
        tableView.separatorColor = UIColor.clear
        tableView.register(UINib(nibName: CommentCell.nibName, bundle: nil),
                           forCellReuseIdentifier: JokesListViewController.commentCellId)
    }

    func setupButtonStyle() {
        loadButton.backgroundColor = getAppearanceConfig().colors.buttonBackgroundColor
        loadButton.titleLabel?.font = getAppearanceConfig().fonts.buttonTextFont
        loadButton.setTitleColor(getAppearanceConfig().colors.buttonTextColor, for: .normal)
        loadButton.setTitle("Jokes_LoadButton".localize(), for: .normal)
        loadButton.layer.cornerRadius = cornerRadius
    }

    // MARK: - Events

    @IBAction func loadButtonAction(_ sender: Any) {
        guard let text = jokesCountTextField.text, !text.isEmpty else {
            return
        }
        guard let count = Int(text) else {
            fatalError("Could not get jokes count")
        }
        getPresenter().onUserSelectedJokesCount(count)
        view.endEditing(true)
    }

    // MARK: - Private

    private func getPresenter() -> JokesListPresenterProtocol {
        guard let presenter = presenter else {
            fatalError("Could not get presenter")
        }
        return presenter
    }
}

// MARK: - JokesListViewProtocol

extension JokesListViewController: JokesListViewProtocol {
    func reloadTable() {
        tableView.reloadData()
    }

    func startPreloader() {
        MBProgressHUD.showAdded(to: view, animated: true).isUserInteractionEnabled = true
    }

    func stopPreloader() {
        MBProgressHUD.hide(for: view, animated: true)
    }
}

// MARK: - UITableViewDataSource

extension JokesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return getPresenter().jokesCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: JokesListViewController.commentCellId,
                                                 for: indexPath)

        guard let commentCell = cell as? CommentCell else {
            fatalError("Cell is not CommentCell")
        }

        fillCell(commentCell, for: indexPath)

        return commentCell
    }

    // MARK: - Private

    private func fillCell(_ cell: CommentCell, for indexPath: IndexPath) {
        let joke = getPresenter().jokeAtIndex(index: indexPath.row)
        cell.setText(joke)
        cell.setupWithAppearanceConfig(getAppearanceConfig())
    }

    private func getAppearanceConfig() -> AppearanceConfigProtocol {
        guard let appearanceConfig = appearanceConfig else {
            fatalError("value did not setted for appearanceConfig")
        }

        return appearanceConfig
    }
}
