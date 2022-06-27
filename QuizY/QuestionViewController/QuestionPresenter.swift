//
//  QuestionPresenter.swift
//  QuizY
//
//  Created by Daniil Batin on 27.06.2022.
//

import Foundation
import UIKit

enum CategoryType: Int, CustomStringConvertible, CaseIterable {
   
    
    case museums = 539
    case justDesserts = 1132
    case lakesRivers = 44
    case wordOrigins = 223
    case people = 442
    case sportsStars = 1914
    case theElements = 1378
    case movies = 4
    case stockSymbols = 2482
    case popMusic = 770

    var description: String {
        switch self {
        case .museums:
            return "Museums"
        case .justDesserts:
            return "Just desserts"
        case .lakesRivers:
            return "Lakes, rivers"
        case .wordOrigins:
            return "Word origins"
        case .people:
            return "People"
        case .sportsStars:
            return "Sports stars"
        case .theElements:
            return "The elements"
        case .movies:
            return "Movies"
        case .stockSymbols:
            return "Stock symbols"
        case .popMusic:
            return "Pop music"
        }
    }
}

protocol QuestionPresenterProvider: AnyObject {
    func onLoad()
    var currentQuestion: CurrentQuestionModel? {get}
}


class QuestionPresenter: QuestionPresenterProvider {
    
    var currentQuestion: CurrentQuestionModel?
    
    weak var view:QuestionViewProvider?
    private let categoryType:CategoryType
    
    init(_ category: CategoryType) {
        categoryType = category
    }
    
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
}
