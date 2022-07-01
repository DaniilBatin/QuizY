//
//  QuestionVC+Extension.swift
//  QuizY
//
//  Created by Daniil Batin on 30.06.2022.
//

import Foundation


extension QuestionViewController : QuestionViewProvider {
   
    func updateView(_ question: String) {
        if question != "" {
            currentQuestionLabel.text = question
        } else {
            currentQuestionLabel.text = "Error with question, please Tap on answer button"
        }
    
        
    }
    
    func startTimer() {
        DispatchQueue.global(qos: .utility).sync {
            self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction), userInfo: nil, repeats: true)
        }
    }
    
    @objc func timerAction() {
        durationTime -= 1
        timerLabel.text = "Time for answer: \(durationTime) sec"
        if durationTime == 0 {
            timer.invalidate()
            presenter.createAlertWithAnswer(self)
        }
    }
    
}
