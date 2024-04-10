//
//  SearchViewModel.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 09/04/24.
//

import Foundation

protocol SearchViewModelDelegate {
    func viewModelDidChanged()
}

class SearchViewModel {
    var delegate: SearchViewModelDelegate?
}
