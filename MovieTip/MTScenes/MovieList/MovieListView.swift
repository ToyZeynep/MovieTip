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
    @State private var year = ""
    @State private var showingActionSheet = false
    @State private var yearList:[String] = ["2000" , "2000" ,"2000" ,"2000" ,"2000"]
    @State private var showingPicker = false
    
    var body: some View {
        NavigationView {
            VStack {
                HStack(spacing: 1) {
                    CustomSearchBar(searchText: $searchText)
                    Button(action: {
                        showingPicker = true
                    }) {
                        Image(systemName: "slider.horizontal.3")
                            .padding(.horizontal, 2)
                            .foregroundColor(.gray)
                    }
                    Button(action: {
                        showingPicker = true
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
                                //    yearList.append(movie.year ?? "")
                                MovieCard(movie: movie)
                            }
                        }
                    }
                }
                
                .onChange(of: searchText) { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        movieListViewModel.getMovieList(searchText: newValue, year: year, page: 1 , type: type)
                    }
                }
                
                .onChange(of: year) { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        movieListViewModel.getMovieList(searchText: newValue, year: year, page: 1 , type: type)
                    }
                }
                
                .onChange(of: type) { newValue in
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        movieListViewModel.getMovieList(searchText: newValue, year: year, page: 1 , type: type)
                    }
                }
                
                .onAppear(){
                    movieListViewModel.getMovieList(searchText: "love", year: year, page: 1 , type: type)
                }
            }
            .sheet(isPresented: $showingPicker) {
                PickerView(years: yearList)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct PickerView: View {
    @State private var selectedYear = ""
    let years: [String]

    var body: some View {
        Form {
            Picker("Select a year", selection: $selectedYear) {
                ForEach(years, id: \.self) { year in
                    Text(year).tag(year)
                }
            }
        }
    }
}

struct ButtonPickerView: View {
    @State private var showingActionSheet = false
    @State private var selectedFruit = "Apple"
    let fruits = ["Apple", "Banana", "Cherry", "Date", "Elderberry"]

    var body: some View {
        VStack(spacing: 20) {
            Text("Selected Fruit: \(selectedFruit)")

            Button("Show Picker") {
                showingActionSheet = true
            }
            .actionSheet(isPresented: $showingActionSheet) {
                ActionSheet(title: Text("Select a fruit"), buttons: fruitButtons())
            }
        }
        .padding()
    }

    func fruitButtons() -> [ActionSheet.Button] {
        var buttons: [ActionSheet.Button] = fruits.map { fruit in
            .default(Text(fruit), action: {
                selectedFruit = fruit
            })
        }
        buttons.append(.cancel())
        return buttons
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListViewModel: MovieListViewModel(movieListService: MovieListUseCase()))
    }
}
