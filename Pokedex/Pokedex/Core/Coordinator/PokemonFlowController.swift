//
//  PokemonFlowController.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 08/04/24.
//

import UIKit

class PokemonFlowController {
    
    private let viewControllerFactory: ViewControllerFactoryProtocol
    private let searchNC: UINavigationController = UINavigationController()
    private let profileNC: UINavigationController = UINavigationController()
    
    public init() {
        self.viewControllerFactory = ViewControllerFactory()
    }
    
    func start() -> UITabBarController {
        let homeVC: UITabBarController = viewControllerFactory.makeHomeViewController()
        
        searchNC.pushViewController(viewControllerFactory.makeSearchViewController(delegate: self), animated: true)
        profileNC.pushViewController(viewControllerFactory.makeProfileViewController(), animated: true)
        
        homeVC.setViewControllers([searchNC, profileNC], animated: true)
        return homeVC
    }
}

extension PokemonFlowController: SearchScreenFlowDelegate {
    func goToPokemonDetail(_ id: Int) {
        searchNC.pushViewController(viewControllerFactory.makePokemonDetailViewController(id), animated: true)
    }
}
