//
//  CategoryPresenter.swift
//  QuizY
//
//  Created by Daniil Batin on 23.06.2022.
//

import Foundation


class CategoryPresenter {
    
//    private let currentArray: [String]
    var filterArray: [String] = []
    
//    init (_ currentArray: [String]) {
////        self.currentArray = currentArray
//        filterArray = currentArray
//    }
    
    func createFilterArray(_ currentArray: [String]) {
        filterArray = currentArray
    }
    
    
}
