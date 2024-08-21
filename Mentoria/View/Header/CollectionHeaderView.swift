//
//  CollectionHeaderView.swift
//  Mentoria
//
//  Created by Karina on 26/07/24.
//

import UIKit
class CollectionHeaderView: UICollectionReusableView {
    
    private let sectionTitle: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.boldSystemFont(ofSize: 20)
        return label
    }()
    
    static let identifier = "Header"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(sectionTitle)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setConstraints() {
        sectionTitle.leading(to: self.leadingAnchor)
        sectionTitle.trailing(to: self.trailingAnchor)
    }
    
    func configureSectionTitle(with text: String) {
        sectionTitle.text = text
    } 
}
