//
//  BaseService.swift
//  MTNetwork
//
//  Created by Saniye Toy on 20.10.2023.
//

import Foundation
import Alamofire

class BaseService {
  static func request<T: Decodable>(_ urlConvertible: URLRequestConvertible, completion: @escaping (Result<T, Error>) -> Void) {
    AF.request(urlConvertible).responseDecodable { (response: AFDataResponse<T>) in
      switch response.result {
      case .success(let responseData):
        completion(.success(responseData))
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}

