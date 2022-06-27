//
//  Errors.swift
//  QuizY
//
//  Created by Daniil Batin on 27.06.2022.
//

import Foundation

enum ServiceError: Error {
    case undefined
    case invalidURL
    case failedDecodingResponse(_ reason: String)
    case general(_ message: String)
}

enum HTTPStatusCode: Int {
    case success = 200
    case internalServerError = 500
}

enum CodeValidation {
    case success
    case failure(reason: String)
    case internalServerError
    case unknown
}
