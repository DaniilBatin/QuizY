//
//  QuestionViewController.swift
//  QuizY
//
//  Created by Daniil Batin on 20.06.2022.
//

import UIKit
import SnapKit

protocol QuestionViewProvider: AnyObject {
    func updateView(_ question: String)
}

class QuestionViewController: UIViewController {

    private var currentCategory:String?
    private let presenter:QuestionPresenterProvider
    
    private lazy var questionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 40)
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.text = "Question:"
        return label
    }()
    
    private lazy var timerLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20)
        label.textAlignment = .center
        label.text = "Time for answer: 00:00"
        return label
    }()
    
    private lazy var currentQuestionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    private lazy var contentQustionView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .systemGray3
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        contentView.layer.shadowRadius = 10.0
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.cornerRadius = 15
        contentView.layer.masksToBounds = false
        return contentView
    }()
    
    private lazy var answerButton: UIButton = {
        let answerButton = UIButton(configuration: .gray(), primaryAction: nil)
        answerButton.frame.size.height = 40
        answerButton.setTitle("Answer", for: .normal)
        answerButton.setTitleColor(.systemGray2, for: .highlighted)
        return answerButton
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSubviews()
        setupConstraints()
        presenter.onLoad()
    }
    
    init(_ presenter:QuestionPresenterProvider) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // Function which setup subviews on main view
    private func setupSubviews() {
        view.addSubview(questionLabel)
        view.addSubview(contentQustionView)
        view.addSubview(answerButton)
        view.addSubview(timerLabel)
        contentQustionView.addSubview(currentQuestionLabel)
        view.backgroundColor = .systemBackground
    }
    
    // Function which setup constraints
    private func setupConstraints() {
        questionLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.top.equalTo(self.view.safeArea.top)
        }
        
        contentQustionView.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(25)
            maker.right.equalToSuperview().inset(25)
            maker.top.equalTo(questionLabel.snp.bottom).inset(-60)
            maker.bottom.equalTo(timerLabel.snp.top).inset(-60)
        }
        
        timerLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview()
            maker.right.equalToSuperview()
            maker.bottom.equalTo(answerButton.snp.top).inset(-50)
        }
        
        answerButton.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(60)
            maker.right.equalToSuperview().inset(60)
            maker.bottom.equalTo(self.view.safeArea.bottom).inset(20)
        }
        
        currentQuestionLabel.snp.makeConstraints { maker in
            maker.left.equalToSuperview().inset(15)
            maker.right.equalToSuperview().inset(15)
            maker.centerWithinMargins.equalToSuperview()
        }
    }
        
    
        
}

extension QuestionViewController : QuestionViewProvider {
    func updateView(_ question: String) {
        if question != "" {
            currentQuestionLabel.text = question
        } else {
            currentQuestionLabel.text = "Error with question, please Tap on answer button"
        }
    
        
    }
    
    
    
}
