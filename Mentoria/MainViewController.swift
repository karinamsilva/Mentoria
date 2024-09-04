//
//  SimpleViewController.swift
//  Mentoria
//
//  Created by Karina on 21/07/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let sectionInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
    private let viewModel = ViewModel(service: Service())
    private var filtered: [Sections] = []
    private var detailCoordinator: AppCoordinator
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    private let searchBar = UISearchController()
    
    init(detailCoordinator: AppCoordinator) {
        self.detailCoordinator = detailCoordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupDelegates()
        registerCollection()
        setupView()
        setupConstraints()
        requestData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.reloadData()
    }
    
    func requestData() {
        viewModel.makeRequest { [weak self] result in
            guard let unwrappedList = self?.viewModel.filtered else { return }
            self?.filtered = unwrappedList
            if result {
                DispatchQueue.main.async {
                    self?.collectionView.reloadData()
                }
            } else {
                print("Erro")
                //To do: create error screen
            }
        }
    }
    
    func setupView() {
        view.addSubview(collectionView)
        navigationItem.searchController = searchBar
        searchBar.searchResultsUpdater = self
    }
    
    func registerCollection() {
        collectionView.register(CollectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: CollectionHeaderView.identifier)
        collectionView.register(SimpleViewCell.self, forCellWithReuseIdentifier: SimpleViewCell.identifier)
        
    }
    
    func setupDelegates() {
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

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SimpleViewCell.identifier, for: indexPath ) as? SimpleViewCell else { return UICollectionViewCell()}
        cell.configure(with: filtered[indexPath.section].characters[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filtered[section].characters.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return filtered.count
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        detailCoordinator.showDetailController(wtih: filtered[indexPath.section].characters[indexPath.row])
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: CollectionHeaderView.identifier, for: indexPath) as? CollectionHeaderView else { return UICollectionReusableView()}
        sectionHeader.configureSectionTitle(with: filtered[indexPath.section].name)
        return sectionHeader
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 30)
    }
}

extension MainViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text else { return }
        filtered = []
        if text.isEmpty {
            filtered = viewModel.filtered
        } else {
            filtered = viewModel.searchCharacterByName(with: text)
        }
        self.collectionView.reloadData()
    }
}
