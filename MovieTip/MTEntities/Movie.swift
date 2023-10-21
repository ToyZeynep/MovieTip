//
//  Movie.swift
//  MTEntities
//
//  Created by Saniye Toy on 21.10.2023.
//

import Foundation

public struct Movie : Codable {
    let title : String?
    let year : String?
    let imdbID : String?
    let type : String?
    let poster : String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
