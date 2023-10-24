//
//  MovieDetailsViewModel.swift
//  MovieTip
//
//  Created by Saniye Toy on 24.10.2023.
//

import SwiftUI
import MTEntities
import MTNetwork

final class MovieDetailsViewModel: ObservableObject {

    @Published var movieDetailsResponse: MovieDetailsResponse?
     var omdbId: String?
    
    private let movieDetailsService: MovieDetailsUseCaseType

    init(omdbId: String? ,movieDetailsService: MovieDetailsUseCaseType) {
        self.movieDetailsService = movieDetailsService
        self.omdbId = omdbId
    }
    
    public func getMovieDetails(){
        var params: [String: Any] = [String: Any]()
        params["i"] = omdbId
        movieDetailsService.getMovieDetails(params: params) { [weak self] result in
            switch result {
            case .success(let success):
                print(success)
                self?.movieDetailsResponse = success
            case .failure(let failure):
                print(failure)
            }
        }
    }
}
