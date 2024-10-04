//
//  SimpleCell.swift
//  Mentoria
//
//  Created by Karina on 21/07/24.
//

import UIKit
import Kingfisher

class SimpleViewCell: UICollectionViewCell {
    
    static let identifier = "SimpleCell"
    
    private let characterName: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setUpConstraints()
    }
    
    func configureUI() {
        contentView.addSubview(characterName)
        contentView.backgroundColor = .systemBlue
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with character: Character) {
        characterName.text =  character.name
    }
    
    func setUpConstraints() {
        characterName.top(to: contentView.topAnchor, constant: 5)
        characterName.bottom(to: contentView.bottomAnchor, constant: -5)
        characterName.leading(to: contentView.leadingAnchor)
        characterName.trailing(to: contentView.trailingAnchor)
    }
}
