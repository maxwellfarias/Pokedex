//
//  ViewControllerFactory.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 08/04/24.
//

import UIKit

protocol ViewControllerFactoryProtocol {
    func makeHomeViewController() -> HomeViewController
    func makeSearchViewController(delegate: SearchScreenFlowDelegate) -> SearchViewController
    func makeProfileViewController() -> ProfileViewController
    func makePokemonDetailViewController(_ id: Int) -> PokemonDetailViewController
}

class ViewControllerFactory: ViewControllerFactoryProtocol {
    func makeHomeViewController() -> HomeViewController {
        return HomeViewController()
    }
    
    func makeSearchViewController(delegate: SearchScreenFlowDelegate) -> SearchViewController {
        let viewModel = SearchViewModel()
        let contentView = SearchScreenView()
        return SearchViewController(viewModel: viewModel, delegate: delegate, contentView: contentView)
    }
    
    func makeProfileViewController() -> ProfileViewController {
        return ProfileViewController()
    }
    
    func makePokemonDetailViewController(_ id: Int) -> PokemonDetailViewController {
        return PokemonDetailViewController(titlePassed: id)
    }
    
    
}
