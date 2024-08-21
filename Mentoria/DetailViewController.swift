//
//  DetailViewController.swift
//  Mentoria
//
//  Created by Karina on 15/08/24.
//

import UIKit

class DetailViewController: UIViewController {
    
    let viewModel = DetailViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        viewModel.setupScreen()
    }
    

}


