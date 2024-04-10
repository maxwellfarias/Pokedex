//
//  SearchTableViewCell.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 08/04/24.
//

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier: String = "searchIdentifier"
    var titleTxt: String = "" {
        didSet {
            nameLb.text = titleTxt
        }
    }
    
    private let nameLb: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension SearchTableViewCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(nameLb)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            nameLb.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            nameLb.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            nameLb.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
}
