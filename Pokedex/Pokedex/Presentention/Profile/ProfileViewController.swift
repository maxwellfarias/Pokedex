//
//  ProfileViewController.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 08/04/24.
//

import UIKit

class ProfileViewController: UIViewController {
    
    init() {
        super.init(nibName: nil, bundle: nil)
        self.title = "Profile"
        self.tabBarItem.image = UIImage(systemName: "person.crop.circle")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private let mainView: UIView = {
        let v = UIView()
        v.backgroundColor = .systemBlue
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
        
        
    }
}

extension ProfileViewController: ViewCodeProtocol {
    func buildViewHierarchy() {
        view.addSubview(mainView)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: view.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            mainView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            mainView.heightAnchor.constraint(equalToConstant: 200)
            
        ])
    }
}

