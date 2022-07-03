//
//  CategoryType.swift
//  QuizY
//
//  Created by Daniil Batin on 03.07.2022.
//

import Foundation

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
