//
//  CustomCell.swift
//  QuizY
//
//  Created by Daniil Batin on 26.05.2022.
//

import UIKit

class CustomCell: UICollectionViewCell {
    
    private lazy var categoryNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 15
        self.layer.masksToBounds = true
        setupSubviews()
        setupConstrains()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
        setupConstrains()
    }
    
    func configure(with model: String){
        categoryNameLabel.text = model
    }
    
    
    private func setupSubviews() {
        contentView.addSubview(categoryNameLabel)
    }
    
    private func setupConstrains() {
        
    }
}
