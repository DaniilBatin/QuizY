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
    
    func updateTimerLabel(_ timerNumber: Int) {
        timerLabel.text = "Time for answer: \(timerNumber) sec"
    }
    
    
}
