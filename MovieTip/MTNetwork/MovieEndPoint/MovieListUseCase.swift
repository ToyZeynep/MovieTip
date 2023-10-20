//
//  MovieListUseCase.swift
//  MTNetwork
//
//  Created by Saniye Toy on 20.10.2023.
//

import Foundation
import Foundation
import Alamofire


protocol MovieListUseCaseType {
    func getMovieDetails(params: [String: Any], completion: @escaping((Result<MovieListResponse, Error>)) -> Void)
}


struct MovieListsUseCase: MovieListUseCaseType {
    
    public init() {
        
    }
    
    func getMovieDetails(params: [String : Any], completion: @escaping((Result<MovieListResponse, Error>)) -> Void) {
        return BaseService.request( MovieEndPoint.movieList(params: params), completion: completion)
    }
}
