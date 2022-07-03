//
//  CategoryPresenter.swift
//  QuizY
//
//  Created by Daniil Batin on 23.06.2022.
//

import Foundation

protocol CategoryPresenterProvider {
    var filterArray: [CategoryType] {get}
    var count: Int {get}
    func createFilterArray(_ currentArray:[CategoryType])
    
}

class CategoryPresenter: CategoryPresenterProvider {
    
    var filterArray: [CategoryType] = []
    
    var count : Int  {
        return filterArray.count
    }
    
    //Function which create filter array and take in another array
    func createFilterArray(_ currentArray: [CategoryType]) {
        filterArray = currentArray
    }
    
 
    
}
