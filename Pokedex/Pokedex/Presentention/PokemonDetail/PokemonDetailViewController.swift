//
//  PokemonDetailViewController.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 08/04/24.
//

import UIKit

class PokemonDetailViewController: UIViewController {
    
    var titlePassed: Int
    
    init(titlePassed: Int) {
        self.titlePassed = titlePassed
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private let mainView: UIView = {
        let v = UIView()
        v.backgroundColor = PokemonColor.grass
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private let label: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyViewCode()
        title = "\(titlePassed)"
    }
}

extension PokemonDetailViewController: ViewCodeProtocol {
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
