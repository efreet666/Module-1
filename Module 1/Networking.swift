//
//  Networking.swift
//  Module 1
//
//  Created by Влад Бокин on 02.08.2022.
//

import Foundation
import Alamofire

enum CheckObtainResult {
    case success(Any)
    case failure(Error)
}

class Networking {
    
    static let URL = "https://www.simbirsoft.com/"
    
    //MARK: - use Alamofire
    
     class func fetchData(_ pageUrl: String, completion: @escaping (CheckObtainResult) -> Void) {
        AF.request(pageUrl)
            .validate()
            .response { responseJson in
            switch responseJson.result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let data):
                completion(.success(data as Any))
                
            }
        }
    }
    
    
}
