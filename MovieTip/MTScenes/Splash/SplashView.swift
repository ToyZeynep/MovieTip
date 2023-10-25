//
//  SplashView.swift
//  MovieTip
//
//  Created by Saniye Toy on 25.10.2023.
//

import SwiftUI
import MTComponent
import MTNetwork
struct SplashView: View {
    @State private var isLinkActive = false
    
    var body: some View {
        ImageFromUrl(url: "https://media4.giphy.com/media/3o7rc0qU6m5hneMsuc/giphy.gif?cid=ecf05e471bsgy1jalevlrei50bfjytwfj0wynl6sbtbxvm0t&ep=v1_gifs_search&rid=giphy.gif&ct=g")
            .frame(width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height)
        NavigationLink("" ,destination: MovieListView(movieListViewModel: MovieListViewModel(movieListService: MovieListUseCase())) , isActive: $isLinkActive)
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isLinkActive = true
                }
            }
    }
}

#Preview {
    SplashView()
}
