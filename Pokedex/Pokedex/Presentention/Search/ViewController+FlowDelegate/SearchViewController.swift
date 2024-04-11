//
//  SearchViewController.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 08/04/24.
//

import UIKit

class SearchViewController: UIViewController {
    private let viewModel: SearchViewModel
    private let delegate: SearchScreenFlowDelegate
    private let contentView: SearchScreenView
    
    init(viewModel: SearchViewModel, delegate: SearchScreenFlowDelegate, contentView: SearchScreenView) {
        self.contentView = contentView
        self.delegate = delegate
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        
        self.title = "Search"
        tabBarItem.image = UIImage(systemName: "magnifyingglass")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        contentView.delegate = self
        setupContentView()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        contentView.frame = view.bounds
    }
    
    private func setupContentView() {
        view.addSubview(contentView)
    }
}

extension SearchViewController: SearchScreenViewDelegate {
    func goToPokemonDetail(_ id: Int) {
        delegate.goToPokemonDetail(id)
    }
}

extension SearchViewController: SearchViewModelDelegate {
    func viewModelDidChanged() {}
}

