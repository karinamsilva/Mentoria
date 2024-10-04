//
//  DetailViewCell.swift
//  Mentoria
//
//  Created by Karina on 20/08/24.
//

import UIKit

class DetailViewCell: UITableViewCell {
    
    static let identifier = "DetailCell"
    
    let characterImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    let characterName = UILabel().createLabel()
    let characterPatronus = UILabel().createLabel()
    let characterBirth = UILabel().createLabel()
    let characterAncestry = UILabel().createLabel()
    let alternateNames = UILabel().createLabel()
    let wandWood = UILabel().createLabel()
    let wandCore = UILabel().createLabel()
    
    let stack: UIStackView =  {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fill
        stack.spacing = 10
        return stack
    }()
    
    func setupCell(from data: Character) {
        characterImage.kf.setImage(with: URL(string: data.imageUrl))
        characterName.text = "Name: \(data.name)"
        characterPatronus.text = "Patronus: \(data.patronus)"
        characterAncestry.text = "Ancestry: \(data.ancestry)"
        alternateNames.text = "Alternate Names: \(data.alternateNames.joined(separator: ", "))"
        wandWood.text = "Wand Wood: \(data.wand.wood)"
        wandCore.text = "Wand Core: \(data.wand.core)"
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubviews() {
        stack.addSubviews([characterName, characterAncestry, characterAncestry,
                           characterPatronus, alternateNames, wandWood, wandCore])
        contentView.addSubview(characterImage)
        contentView.addSubview(stack)
    }
    
    func setConstraints() {
        characterImage.leading(to: leadingAnchor)
        characterImage.trailing(to: trailingAnchor)
        characterImage.top(to: contentView.topAnchor, constant: 5)
        characterImage.height(to: 250)
        
        stack.top(to: characterImage.bottomAnchor, constant: 5)
        stack.leading(to: contentView.leadingAnchor)
        stack.trailing(to: contentView.trailingAnchor)
        stack.bottom(to: contentView.bottomAnchor)
    }
}
