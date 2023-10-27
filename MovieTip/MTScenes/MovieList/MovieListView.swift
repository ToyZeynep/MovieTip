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
        NavigationLink(destination: MovieDetailsView(movieDetailsViewModel: MovieDetailsViewModel(omdbId: movie.imdbID, movieDetailsService: MovieDetailsUseCase()))) {
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
}

struct CustomSearchBar: View {
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search movies...", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.vertical, 8)
        }
        .padding(.horizontal)
    }
}

struct MovieListView: View {
    @ObservedObject var movieListViewModel: MovieListViewModel
    @State var type: String = "movie"
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 1) {
                    CustomSearchBar(searchText: $searchText)
                    
                    Button(action: {
                      
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .padding(.horizontal, 2)
                            .foregroundColor(.gray)
                    }
                    Button(action: {
                      
                    }) {
                        Image(systemName: "arrow.up.arrow.down.square.fill")
                            .padding(.horizontal, 2)
                            .foregroundColor(.gray)
                    }
                }
                .padding(.horizontal, 2)
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
                
                .onChange(of: searchText) { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        movieListViewModel.getMovieList(searchText: newValue, page: 1 , type: type)
                    }
                }
                .onAppear(){
                    movieListViewModel.getMovieList(searchText: "ara", page: 1 , type: type)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListViewModel: MovieListViewModel(movieListService: MovieListUseCase()))
    }
}
