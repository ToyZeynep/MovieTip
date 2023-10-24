//
//  MovieTipApp.swift
//  MovieTip
//
//  Created by Saniye Toy on 20.10.2023.
//

import SwiftUI
import SwiftData
import MTNetwork

@main
struct MovieTipApp: App {
//    var sharedModelContainer: ModelContainer = {
//        let schema = Schema([
//            Item.self,
//        ])
//        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//
//        do {
//            return try ModelContainer(for: schema, configurations: [modelConfiguration])
//        } catch {
//            fatalError("Could not create ModelContainer: \(error)")
//        }
//    }()

    var body: some Scene {
        WindowGroup {
            MovieListView(movieListViewModel: MovieListViewModel(movieListService: MovieListUseCase()))
        }
        //.modelContainer(sharedModelContainer)
    }
}
