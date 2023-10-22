//
//  MovieListResponse.swift
//  MTEntities
//
//  Created by Saniye Toy on 21.10.2023.
//

import Foundation

public struct MovieListResponse: Codable {
    public let movies : [Movie]?
    public let totalResults : String?
    public let response : String?
    
    enum CodingKeys: String, CodingKey {
        case movies = "Search"
        case totalResults = "totalResults"
        case response = "Response"
    }
}
