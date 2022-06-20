//
//  CustomCell.swift
//  QuizY
//
//  Created by Daniil Batin on 26.05.2022.
//

import UIKit
import SnapKit

class CustomCell: UICollectionViewCell {
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.textColor = .darkGray
        label.textAlignment = .center
        return label
    }()
    
    private lazy var categoryLogo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        setupSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        setupConstraints()
    }
    
    // Function which take some string
    func configure(with model:  String){
        categoryNameLabel.text = model
        categoryLogo.image = UIImage(named: model)

    }
    
    // Function which setup subviews on content view
    private func setupSubviews() {
        contentView.addSubview(categoryNameLabel)
        contentView.addSubview(categoryLogo)
    }
    
    // Function which setup constraints
    private func setupConstraints() {
        categoryNameLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(15)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalToSuperview().inset(5)
        }
        
        categoryLogo.snp.makeConstraints { maker in
            maker.top.equalToSuperview().inset(15)
            maker.left.equalToSuperview().inset(15)
            maker.right.equalToSuperview().inset(15)
            maker.bottom.equalTo(categoryNameLabel).inset(30)
        }
    }
}
