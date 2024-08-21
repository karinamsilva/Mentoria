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
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.numberOfLines = 0
        return label
    }()
    
    let characterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.spacing = 5
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        setUpConstraints()
    }
    
    func configureUI() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(characterImage)
        stackView.addArrangedSubview(characterName)
        contentView.backgroundColor = .systemBlue
        contentView.layer.cornerRadius = 8
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with character: Character) {
        characterName.text =  character.name
        characterImage.kf.setImage(with: URL(string: character.image))
    }
    
    func setUpConstraints() {
        stackView.top(to: contentView.topAnchor, constant: 5)
        stackView.bottom(to: contentView.bottomAnchor, constant: -5)
        stackView.leading(to: contentView.leadingAnchor)
        stackView.trailing(to: contentView.trailingAnchor)
    }
}







