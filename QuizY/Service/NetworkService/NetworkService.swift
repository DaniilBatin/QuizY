//
//  NetworkService.swift
//  QuizY
//
//  Created by Daniil Batin on 27.06.2022.
//

import Foundation
import Alamofire

protocol NetworkServiceContext {
    typealias CategoryCompletion = (_ result: Result<QuizCategoryModel, ServiceError>) -> Void
    func getCategory(id: Int, completion: @escaping CategoryCompletion)
}

class NetworkService: NetworkServiceContext {
    static let mainUrl = "http://jservice.io/api/category?id="
    
    static let shared:NetworkServiceContext = NetworkService()
    
    private init() {}
    
    func getCategory(id: Int, completion: @escaping CategoryCompletion) {
        let fullUrl = "\(NetworkService.mainUrl)\(id)"
        AF.request(fullUrl).validate(statusCode: 200..<299).responseData {  afData in
            do {
                guard let data = afData.data
                else { completion(.failure(.general("Empty Data")))
                    return
                }
                let model = try JSONDecoder().decode(QuizCategoryModel.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(model))
                }
            }
            catch let error {
                DispatchQueue.main.async {
                    completion(.failure(.failedDecodingResponse(error.localizedDescription)))
                }
            }
        }
        
    }
    
}
