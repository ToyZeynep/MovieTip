//
//  MovieDetailsUseCase.swift
//  MTNetwork
//
//  Created by Saniye Toy on 20.10.2023.
//

import Foundation
import MTEntities
import Alamofire


public protocol MovieDetailsUseCaseType {
    func getMovieDetails(params: [String: Any], completion: @escaping((Result<MovieDetailsResponse, Error>)) -> Void)
}


public struct MovieDetailsUseCase: MovieDetailsUseCaseType {
    
    public init() {
        
    }
    
    public  func getMovieDetails(params: [String : Any], completion: @escaping((Result<MovieDetailsResponse, Error>)) -> Void) {
        return BaseService.request( MovieEndPoint.movieDetails(params: params), completion: completion)
    }
}
