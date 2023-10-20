//
//  MovieEndPoint.swift
//  MTNetwork
//
//  Created by Saniye Toy on 20.10.2023.
//

import Foundation
import Foundation
import Alamofire

enum MovieEndPoint: BaseRequest {
    
    case movieList(params: [String: Any])
    case movieDetails(params: [String: Any])
    
    var method: HTTPMethod {
        switch self {
        case .movieList:
            return .get
        case .movieDetails:
            return .get
        }
    }
    
    var path: String {
        switch self {
        case .movieList:
            return ""
        case .movieDetails:
            return ""
        }
    }
    
    var parameters: Parameters? {
        switch self {
        case .movieList(let params):
            return params
        case .movieDetails(let params):
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = try ServiceConstant.baseURL.asURL()
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        let encoding: ParameterEncoding = {
            switch method {
            case .post:
                return JSONEncoding.default
            default:
                return URLEncoding.default
            }
        }()
        print(urlRequest)
        return try encoding.encode(urlRequest, with: parameters)
    }
}
