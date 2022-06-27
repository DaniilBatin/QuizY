//
//  QuizCategoryModel.swift
//  QuizY
//
//  Created by Daniil Batin on 27.06.2022.
//

import Foundation

struct QuizCategoryModel: Decodable {
    let questions: [QuestionModel]
    
    enum CodingKeys: String, CodingKey {
        case questions = "clues"
    }
}

struct QuestionModel: Decodable {
    let answer: String
    let question: String
}
