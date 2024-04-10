//
//  ViewColdeProtocol.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 08/04/24.
//

import Foundation

public protocol ViewCodeProtocol {
    func buildViewHierarchy()
    func setupConstraints()
    func configureViews()
}

public extension ViewCodeProtocol {
    func applyViewCode() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }
    
    func configureViews(){}
}
