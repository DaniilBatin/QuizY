//
//  NetworkService+ErrorHandler.swift
//  QuizY
//
//  Created by Daniil Batin on 27.06.2022.
//

import Foundation

typealias StatusCodeValidationCompletion = (_ validation: CodeValidation) -> Void

protocol StatucCodeHandable {
    func handleServerStatusCode(_ code: Int, completion: @escaping StatusCodeValidationCompletion)
}

extension NetworkService: StatucCodeHandable {
    
    //Function which handle status code from server
    func handleServerStatusCode(_ code: Int, completion: @escaping StatusCodeValidationCompletion) {
        switch HTTPStatusCode(rawValue: code) {
        case .success:
            completion(.success)
        case .internalServerError:
            completion(.internalServerError)
        default:
            completion(.unknown)
        }
    }
}
