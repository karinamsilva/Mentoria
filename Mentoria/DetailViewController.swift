//
//  DetailViewController.swift
//  Mentoria
//
//  Created by Karina on 15/08/24.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    private let viewModel: DetailViewModel
    
    private let tableView = UITableView()
    
    init(viewModel: DetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupTableView() {
        tableView.register(DetailViewCell.self, forCellReuseIdentifier: DetailViewCell.identifier)
        tableView.dataSource = self
        tableView.isScrollEnabled = false
        tableView.separatorStyle = .none
        view.addSubview(tableView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.setupScreen()
        setupTableView()
        createConstraints()
    }
    
    func createConstraints() {
        tableView.top(to: view.topAnchor)
        tableView.leading(to: view.leadingAnchor)
        tableView.trailing(to: view.trailingAnchor)
        tableView.bottom(to: view.bottomAnchor)
    }
    
}

extension DetailViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: DetailViewCell.identifier, for: indexPath) as? DetailViewCell else { return UITableViewCell()}
        cell.selectionStyle = .none
        cell.setupCell(from: viewModel.character)
        return cell
    }
}
