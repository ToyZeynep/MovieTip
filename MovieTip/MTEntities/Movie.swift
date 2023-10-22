//
//  Movie.swift
//  MTEntities
//
//  Created by Saniye Toy on 21.10.2023.
//

import Foundation

public struct Movie : Codable {
    public let title : String?
    public let year : String?
    public let imdbID : String?
    public let type : String?
    public let poster : String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case imdbID = "imdbID"
        case type = "Type"
        case poster = "Poster"
    }
}
