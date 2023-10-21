//
//  MovieDetailResponse.swift
//  MTEntities
//
//  Created by Saniye Toy on 21.10.2023.
//

import Foundation

public struct MovieDetailsResponse: Codable{
    let title : String?
    let year : String?
    let rated : String?
    let released : String?
    let runtime : String?
    let genre : String?
    let director : String?
    let writer : String?
    let actors : String?
    let plot : String?
    let language : String?
    let country : String?
    let awards : String?
    let poster : String?
    let metascore : String?
    let imdbRating : String?
    let imdbVotes : String?
    let imdbID : String?
    let type : String?
    let dVD : String?
    let boxOffice : String?
    let production : String?
    let website : String?
    let response : String?
    
    enum CodingKeys: String, CodingKey {
        case title = "Title"
        case year = "Year"
        case rated = "Rated"
        case released = "Released"
        case runtime = "Runtime"
        case genre = "Genre"
        case director = "Director"
        case writer = "Writer"
        case actors = "Actors"
        case plot = "Plot"
        case language = "Language"
        case country = "Country"
        case awards = "Awards"
        case poster = "Poster"
        case metascore = "Metascore"
        case imdbRating = "imdbRating"
        case imdbVotes = "imdbVotes"
        case imdbID = "imdbID"
        case type = "Type"
        case dVD = "DVD"
        case boxOffice = "BoxOffice"
        case production = "Production"
        case website = "Website"
        case response = "Response"
    }
}
