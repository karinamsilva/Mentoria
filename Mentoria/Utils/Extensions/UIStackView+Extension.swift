//
//  UIStackView+Extension.swift
//  Mentoria
//
//  Created by Karina on 04/09/24.
//

import UIKit

extension UIStackView {
    func addSubviews(_ views: [UIView]) {
        for view in views {
            addArrangedSubview(view)
        }
    }
}
