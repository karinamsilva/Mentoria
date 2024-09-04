//
//  UILabelExtension.swift
//  Mentoria
//
//  Created by Karina on 04/09/24.
//

import UIKit

extension UILabel {
    func createLabel() -> UILabel {
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }
}
