//
//  QuestionVC+Extension.swift
//  QuizY
//
//  Created by Daniil Batin on 30.06.2022.
//

import Foundation
import UIKit

extension QuestionViewController : QuestionViewProvider {
   
    //Function which update currentQuestionLabel
    func updateView(_ question: String) {
        if question != "" {
            currentQuestionLabel.text = question
        } else {
            currentQuestionLabel.text = "Error with question, please Tap on answer button"
        }
    }
    
    //Function which update timerLabel
    func updateTimerLabel(_ timerNumber: Int) {
        timerLabel.text = "Time for answer: \(timerNumber) sec"
    }
    
    //Function which create alert with answer 
    func createAlert(_ message: String) {
        let alert = UIAlertController(title: "Answer",
                                      message: message,
                                      preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title:"Next question", style:.cancel, handler: { _ in
            self.presenter.onLoad()
            self.presenter.timer.invalidate()
            self.presenter.startTimer()
            self.presenter.durationTime = 21
        }))
        self.present(alert, animated: true)
    }
    
}
