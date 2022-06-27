//
//  CurrentQuestionModel.swift
//  QuizY
//
//  Created by Daniil Batin on 27.06.2022.
//

import Foundation

struct CurrentQuestionModel {
    let answer: String
    let question: String
    
    init(_ model: QuestionModel) {
        answer = model.answer
        question = model.question
    }
    
}
