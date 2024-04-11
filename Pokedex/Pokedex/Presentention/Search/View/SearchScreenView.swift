//
//  SearchScreenView.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 09/04/24.
//

import UIKit

class SearchScreenView: UIView {
/*   Como a viewController ira fazer referencia a essa classe e essa classe tambem fara referencia a ela com o delegate, foi necessario usar o weak
A fim de evitar memory leak*/
    public weak var delegate: SearchScreenViewDelegate?
    
    private let table: UITableView = {
        let table = UITableView()
        table.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupScreenSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        table.frame = self.bounds
    }
    
    private func setupScreenSetup() {
        addSubview(table)
        table.dataSource = self
        table.delegate = self
        table.rowHeight = 90
        table.separatorStyle = .none
    }
}

extension SearchScreenView: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as! SearchTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.goToPokemonDetail(indexPath.row)
    }
}


