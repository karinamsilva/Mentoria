//
//  SimpleCell.swift
//  Mentoria
//
//  Created by Karina on 21/07/24.
//

import UIKit

class SimpleViewCell: UICollectionViewCell {
    
    static let identifier = "SimpleCell"
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setUpConstraints()
    }
    
    func configureUI() {
        contentView.addSubview(titleLabel)
        contentView.backgroundColor = .systemBlue
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(title: String) {
        titleLabel.text = title
    }
    
    func setUpConstraints() {
        titleLabel.centerX(to: centerXAnchor)
        titleLabel.centerY(to: centerYAnchor)
        titleLabel.leading(to: contentView.leadingAnchor, constant: 8)
        titleLabel.trailing(to: contentView.trailingAnchor, constant: -8)
    }
}







