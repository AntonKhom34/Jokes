//
//  View+Stretch.swift
//  Jokes
//
//  Created by Антон Хомяков on 15/06/2019.
//  Copyright © 2019 Антон Хомяков. All rights reserved.
//

import UIKit

extension UIView {
    func stretchToSuperview() {
        guard let superview = superview else {
            fatalError("Could not find superview")
        }

        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: 0).isActive = true
        trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: 0).isActive = true
        topAnchor.constraint(equalTo: superview.topAnchor, constant: 0).isActive = true
        bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: 0).isActive = true
    }
}
