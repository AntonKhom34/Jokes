//
//  CommentCell.swift
//  Jokes
//
//  Created by Антон Хомяков on 14/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

class CommentCell: UITableViewCell, AppearanceConfigurable {

    // MARK: - Outlet

    @IBOutlet private weak var rootLabel: UILabel!

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    // MARK: - Public

    func setText(_ text: String) {
        rootLabel.text = "  \(text)"
    }

    // MARK: - AppearanceConfigurable

    func setupWithAppearanceConfig(_ config: AppearanceConfigProtocol) {
        rootLabel.font = config.fonts.jokeTextFont
        rootLabel.textColor = config.colors.jokeTextColor
    }

}

extension CommentCell {
    static let nibName = "CommentCell"
}
