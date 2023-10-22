//
//  MovieListUseCase.swift
//  MTNetwork
//
//  Created by Saniye Toy on 20.10.2023.
//

import Foundation
import Alamofire
import MTEntities

public protocol MovieListUseCaseType {
    func getMovieList(params: [String: Any], completion: @escaping((Result<MovieListResponse, Error>)) -> Void)
}


public struct MovieListUseCase: MovieListUseCaseType {
    
    public init() {}
    
    public func getMovieList(params: [String : Any], completion: @escaping((Result<MovieListResponse, Error>)) -> Void) {
        return BaseService.request( MovieEndPoint.movieList(params: params), completion: completion)
    }
}
