//
//  UIImageView+Extension.swift
//  Mentoria
//
//  Created by Karina on 15/08/24.
//

import UIKit
import Kingfisher

extension UIImageView {
    func getImage(from string: String) {
        guard let url = URL(string: string) else { return }
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}
