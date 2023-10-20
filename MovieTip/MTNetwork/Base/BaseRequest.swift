//
//  BaseRequest.swift
//  MTNetwork
//
//  Created by Saniye Toy on 20.10.2023.
//

import Foundation
import Alamofire

protocol BaseRequest: URLRequestConvertible {
  var method: HTTPMethod { get }
  var path: String { get }
  var parameters: Parameters? { get }
}
