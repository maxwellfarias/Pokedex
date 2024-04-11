//
//  SearchTableViewCell.swift
//  brushUpUIKit
//
//  Created by Maxwell Farias on 08/04/24.
//#imageLiteral(resourceName: "bulbasaur.png")

import UIKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier: String = "searchIdentifier"
    private let maxImageSize: CGFloat = 70
    var favoriteIconSelected: Bool = false
    
    private lazy var mainView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 15
        v.clipsToBounds = true
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    
    private lazy var nameLb: UILabel = {
        let lb = UILabel()
        lb.text = "Bulbasaur"
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    private lazy var imageIv: UIImageView = {
        let imgView: UIImageView = UIImageView(image: UIImage(named: "bulbasaur"))
        imgView.contentMode = .scaleAspectFit
        imgView.clipsToBounds = true
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()
    
    private lazy var firstIconType: UIImageView = {
        let image = UIImage(systemName: "leaf.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .small))
        let img = UIImageView(image: image)
        img.backgroundColor = PokedexColor.grass
        img.tintColor = .white
        img.layer.cornerRadius = (image?.size.height ?? 10.0)/2
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var secondIconType: UIImageView = {
        let image = UIImage(systemName: "exclamationmark.triangle.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .small))
        let img = UIImageView(image: image)
        img.backgroundColor = PokedexColor.poison
        img.tintColor = .white
        img.layer.cornerRadius = (image?.size.height ?? 10.0)/2
        img.translatesAutoresizingMaskIntoConstraints = false
        return img
    }()
    
    private lazy var numberLb: UILabel = {
        let lb = UILabel()
        lb.text = "#001"
        lb.textColor = .white
        lb.font = UIFont.systemFont(ofSize: 34, weight: .bold)
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.alpha = 0.6
        return lb
    }()
    
    lazy var favoriteIcon: UIButton = {
        let btn = UIButton(type: .system)
        btn.setImage(UIImage(systemName: "heart"), for: .normal)
        btn.tintColor = .white
        btn.alpha = 0.6
        btn.addTarget(self, action: #selector(favoriteIconTapped), for: .touchUpInside)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        applyViewCode()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layoutIfNeeded()
        addGradient()
        
    }
    
    private func addGradient() {
        let gradientLayer = CAGradientLayer()
        //       gradientLayer.locations = [0.0, 0.75, 1.0]
               gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.5)
               gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.5)
        gradientLayer.colors = [
            PokedexColor.bgGrass?.cgColor ?? UIColor.clear.cgColor,
            PokedexColor.bgGrass?.cgColor ?? UIColor.clear.cgColor,
            PokedexColor.bgPoison?.cgColor ?? UIColor.clear.cgColor
        ]
        gradientLayer.frame = mainView.bounds
        mainView.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    @objc private func favoriteIconTapped() {
        favoriteIconSelected.toggle()
        favoriteIcon.setImage(UIImage(systemName: favoriteIconSelected ? "heart.fill" : "heart"), for: .normal)
        favoriteIcon.tintColor = favoriteIconSelected ? .red : .white
    }
    
    func prepareViews(image: UIImage, name: String, firstIconType: UIImage, secondIconType: UIImage, number: String) {
        self.imageIv.image = image
        self.nameLb.text = name
        self.firstIconType.image = firstIconType
        self.secondIconType.image = secondIconType
        self.numberLb.text = number
    }
}

extension SearchTableViewCell: ViewCodeProtocol {
    func buildViewHierarchy() {
        contentView.addSubview(mainView)
        mainView.addSubview(nameLb)
        mainView.addSubview(imageIv)
        mainView.addSubview(firstIconType)
        mainView.addSubview(secondIconType)
        mainView.addSubview(secondIconType)
        mainView.addSubview(numberLb)
        mainView.addSubview(favoriteIcon)
    }
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 5),
            mainView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            mainView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            mainView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
            
            imageIv.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5),
            imageIv.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 15),
            imageIv.heightAnchor.constraint(equalToConstant: maxImageSize),
            imageIv.widthAnchor.constraint(equalToConstant: maxImageSize),
            
            nameLb.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 10),
            nameLb.leadingAnchor.constraint(equalTo: imageIv.trailingAnchor, constant: 15),
            
            firstIconType.topAnchor.constraint(equalTo: nameLb.bottomAnchor),
            firstIconType.leadingAnchor.constraint(equalTo: nameLb.leadingAnchor),
            
            secondIconType.topAnchor.constraint(equalTo: nameLb.bottomAnchor),
            secondIconType.leadingAnchor.constraint(equalTo: firstIconType.trailingAnchor, constant: 2),
            
            numberLb.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -5),
            numberLb.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -10),
            
            favoriteIcon.topAnchor.constraint(equalTo: nameLb.topAnchor),
            favoriteIcon.trailingAnchor.constraint(equalTo: numberLb.trailingAnchor)
        ])
    }
}
