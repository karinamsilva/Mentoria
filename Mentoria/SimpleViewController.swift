//
//  SimpleViewController.swift
//  Mentoria
//
//  Created by Karina on 21/07/24.
//

import UIKit

class SimpleViewController: UIViewController {
    
    private let sectionInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollection()
        setupView()
        setupConstraints()
    }
    
    func setupView() {
        view.addSubview(collectionView)
    }
    
    func setupCollection() {
        collectionView.register(SimpleViewCell.self, forCellWithReuseIdentifier: SimpleViewCell.identifier)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    func setupConstraints() {
        collectionView.top(to: view.safeAreaLayoutGuide.topAnchor)
        collectionView.bottom(to: view.safeAreaLayoutGuide.bottomAnchor)
        collectionView.leading(to: view.leadingAnchor, constant: 8)
        collectionView.trailing(to: view.trailingAnchor, constant: -8)
    }
    
}

extension SimpleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleViewCell.identifier, for: indexPath ) as? SimpleViewCell else { return UICollectionViewCell()}
        cell.configure(title: "Item \(indexPath.row + 1)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
}

extension SimpleViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let paddingSpace = sectionInsets.left * 3
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / 2
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sectionInsets.left
    }

}


