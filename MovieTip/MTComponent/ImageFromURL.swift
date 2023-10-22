//
//  ImageFromURL.swift
//  MTComponent
//
//  Created by Saniye Toy on 21.10.2023.
//

import SwiftUI
import Kingfisher

public struct ImageFromUrl: View {
    
    var url: String
    var showPlaceholder: Bool = true
    
    public init(url: String, showPlaceholder: Bool = true) {
        self.url = url
        self.showPlaceholder = showPlaceholder
    }
    
    public var body: some View {
        KFImage.url(URL(string: url))
            .resizable()
            .scaledToFill()
            .cornerRadius(10)
            .shadow(radius: 5)
    }
}

struct ImageFromUrl_Previews: PreviewProvider {
    static var previews: some View {
        ImageFromUrl(url: "https://github.com/onevcat/Kingfisher/blob/master/images/kingfisher-1.jpg?raw=true", showPlaceholder: false)
            .previewLayout(.fixed(width: 200, height: 200))
    }
}
