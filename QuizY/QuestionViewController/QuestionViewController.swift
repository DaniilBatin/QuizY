//
//  QuestionViewController.swift
//  QuizY
//
//  Created by Daniil Batin on 20.06.2022.
//

import UIKit
import SnapKit

class QuestionViewController: UIViewController {

    private var currentCategory:String?
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.textColor = .black
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = "Question:"
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
    }
    
    init(_ selectCategory:String) {
        super.init(nibName: nil, bundle: nil)
        currentCategory = selectCategory
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Function which setup subviews on main view
    private func setupSubviews() {
        view.addSubview(questionLabel)
        view.backgroundColor = .systemBackground
    }
    
    // Function which setup constraints
    private func setupConstraints() {
        questionLabel.snp.makeConstraints { maker in
            maker.width.equalTo(self.view.snp.width)
//            maker.right.equalTo(self.view.snp.right)
            maker.top.equalTo(self.view.safeArea.top)
        }
    }
        
        
}
