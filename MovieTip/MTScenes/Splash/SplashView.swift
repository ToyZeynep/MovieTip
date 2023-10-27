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
        NavigationView {
            VStack {
                KingfisherGifView(urlString: "https://i.gifer.com/8V9H.gif")
                          .frame(width: 200, height: 200)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                            isLinkActive = true
                        }
                    }
                NavigationLink(
                    destination: MovieListView(movieListViewModel: MovieListViewModel(movieListService: MovieListUseCase())),
                    isActive: $isLinkActive
                ) {
                    EmptyView()
                }
            }
        }
    }
}


#Preview {
    SplashView()
}

struct KingfisherGifView: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }

    func updateUIView(_ uiView: UIImageView, context: Context) {
        guard let url = URL(string: urlString) else { return }
        
        uiView.kf.setImage(with: url, options: [.cacheOriginalImage])
    }
}
