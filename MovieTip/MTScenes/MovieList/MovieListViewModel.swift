//
//  MovieListViewModel.swift
//  MovieTip
//
//  Created by Saniye Toy on 21.10.2023.
//


import SwiftUI
import MTEntities
import MTNetwork

final class MovieListViewModel: ObservableObject {

    @Published var movieListResponse: MovieListResponse?

    
    private let movieListService: MovieListUseCaseType

    init(movieListService: MovieListUseCaseType) {
        self.movieListService = movieListService
    }
    
    public func getMovieList(searchText: String , year: String, page: Int , type: String){
        var params: [String: Any] = [String: Any]()
        params["page"] = page
        params["s"] = searchText
        params["type"] = type
        params["y"] = year
        movieListService.getMovieList(params: params) { [weak self] result in
            switch result {
            case .success(let success):
                print(success)
                self?.movieListResponse = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
