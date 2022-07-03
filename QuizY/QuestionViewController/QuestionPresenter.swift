//
//  QuestionPresenter.swift
//  QuizY
//
//  Created by Daniil Batin on 27.06.2022.
//

import Foundation
import UIKit

protocol QuestionPresenterProvider: AnyObject {
    func onLoad()
    var currentQuestion: CurrentQuestionModel? {get}
    func createAlertWithAnswer()
    func startTimer()
    var timer:Timer {get}
    var durationTime: Int {get set}
}


class QuestionPresenter: QuestionPresenterProvider {
    
    var currentQuestion: CurrentQuestionModel?
    var timer = Timer()
    var durationTime = 20
    weak var view:QuestionViewProvider?
    private let categoryType:CategoryType
    
    init(_ category: CategoryType) {
        categoryType = category
    }
    
    //Function which load current array by categoryType and take random question from incoming array
    func onLoad() {
        NetworkService.shared.getCategory(id: categoryType.rawValue) { [weak self] result in
            switch result {
            case .success(let models):
                guard let model = models.questions.randomElement() else {return}
                let questionModel = CurrentQuestionModel(model)
                self?.currentQuestion = questionModel
                self?.view?.updateView(questionModel.question)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    //Function which passed data to createAlert function
    func createAlertWithAnswer() {
        guard let answer = currentQuestion?.answer else {return}
        view?.createAlert(answer)
    }
    
    //Function which start timer
    func startTimer() {
        DispatchQueue.global(qos: .utility).sync {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerAction() {
        durationTime -= 1
        self.view?.updateTimerLabel(durationTime)
        if durationTime == 0 {
            timer.invalidate()
            createAlertWithAnswer()
        }
    }
    
    
}
