//
//  QuestionViewMock.swift
//  QuizYTests
//
//  Created by Daniil Batin on 02.07.2022.
//

import Foundation
@testable import QuizY

class QuestionViewMock: QuestionViewProvider {
    
    var isUpdateTriggedView = false
    var isUpdateTriggedTimer = false
    var isUpdateTriggedAlert = false
    
    func createAlert(_ message: String) {
        isUpdateTriggedAlert = true
    }
    
    func updateView(_ question: String) {
        isUpdateTriggedView = true
    }
    
    func updateTimerLabel(_ timerNumber: Int) {
        isUpdateTriggedTimer = true
    }
    
    
}
