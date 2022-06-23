//
//  CategoryPresenter.swift
//  QuizY
//
//  Created by Daniil Batin on 23.06.2022.
//

import Foundation


class CategoryPresenter {
    
    var filterArray: [String] = []
    
  
    func createFilterArray(_ currentArray: [String]) {
        filterArray = currentArray
    }
    
    var count : Int  {
        return filterArray.count
    }
    
}
