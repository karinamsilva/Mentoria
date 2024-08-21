//
//  DetailViewCell.swift
//  Mentoria
//
//  Created by Karina on 20/08/24.
//

import UIKit

class DetailViewCell: UICollectionViewCell {
    
    static let identifier = "DetailCell"
    
    let characterImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    let characterName: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    let stack: UIStackView =  {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.distribution = .fillEqually
        return stack
    }()
    
    func setupCell(from data: Character) {
        characterImage.getImage(from: data.image)
        characterName.text = data.name
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setConstraints()
        addSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        stack.addArrangedSubview(characterImage)
        stack.addArrangedSubview(characterName)
        contentView.addSubview(stack)
    }
    
    func setConstraints() {
        stack.top(to: contentView.topAnchor)
        stack.leading(to: leadingAnchor)
        stack.trailing(to: trailingAnchor)
        stack.bottom(to: contentView.bottomAnchor)
    }
    
    
    
    
}
