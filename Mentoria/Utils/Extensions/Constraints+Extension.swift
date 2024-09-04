//
//  Extensions.swift
//  Mentoria
//
//  Created by Karina on 21/07/24.
//

import UIKit

extension UIView {
    @discardableResult
    func centerX(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        centerXAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func centerY(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        centerYAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func leading(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        leadingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func trailing(to anchor: NSLayoutXAxisAnchor, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        trailingAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func bottom(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        bottomAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func top(to anchor: NSLayoutYAxisAnchor, constant: CGFloat = 0) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: anchor, constant: constant).isActive = true
        return self
    }
    
    @discardableResult
    func height(to constant: CGFloat) -> Self {
        translatesAutoresizingMaskIntoConstraints = false
        heightAnchor.constraint(equalToConstant: constant).isActive = true 
        return self
    }
    
}
