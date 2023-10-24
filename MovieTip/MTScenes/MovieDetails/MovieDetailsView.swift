//
//  MovieDetailsView.swift
//  MovieTip
//
//  Created by Saniye Toy on 24.10.2023.
//

import SwiftUI
import MTEntities
import MTNetwork
import MTComponent
struct MovieDetailsView: View {
    @ObservedObject var movieDetailsViewModel: MovieDetailsViewModel
        var body: some View {
            VStack {
                if let movie = movieDetailsViewModel.movieDetailsResponse {
                    ImageFromUrl(url: movie.poster ?? "")
                        .frame(width: 300, height: 400)
                    
                    Text(movie.title ?? "")
                        .font(.title)
                        .bold()
                        .padding(.top, 10)
                    
                    Text(movie.plot ?? "")
                        .font(.body)
                        .padding(.top, 5)
                        .padding(.horizontal, 10)
                    
                    Text(movie.imdbRating ?? "")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 5)
                }
            }
            .padding()
            .onAppear(){
                movieDetailsViewModel.getMovieDetails()
            }
            Spacer()
        }
    }

    struct MovieDetailView_Previews: PreviewProvider {
        static var previews: some View {
            MovieDetailsView(movieDetailsViewModel: MovieDetailsViewModel(omdbId: "", movieDetailsService: MovieDetailsUseCase()))
        }
    }
