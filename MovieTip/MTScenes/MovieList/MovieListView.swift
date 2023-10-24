//
//  SwiftUIView.swift
//  MovieTip
//
//  Created by Saniye Toy on 21.10.2023.
//

import SwiftUI
import MTEntities
import MTNetwork
import MTComponent
import Kingfisher

struct MovieCard: View {
    var movie: Movie
    
    var body: some View {
        VStack {
            ImageFromUrl(url: movie.poster ?? "")
                .frame(width: 150, height: 230)
            Text(movie.title ?? "")
                .font(.system(size: 15, weight: .bold, design: .default))
                .lineLimit(2)
                .multilineTextAlignment(.center)
            Text(movie.year ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
        .frame(width: 150, height: 300)
        .padding([.leading, .trailing], 10)
    }
}

struct MovieListView: View {
    @ObservedObject var movieListViewModel: MovieListViewModel
    @State var type: String = "movie"
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], alignment: .center, spacing: 10) {
                    if let movieList = movieListViewModel.movieListResponse?.movies {
                        
                        ForEach(0..<(movieList.count), id: \.self) { index in
                            let movie = movieList[index]
                            MovieCard(movie: movie)
                        }
                    }
                }
            }
            .navigationTitle(type)
            .onAppear(){
                movieListViewModel.getMovieList(searchText: "Ali", page: 1 , type: type)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListViewModel: MovieListViewModel(movieListService: MovieListUseCase()))
    }
}
