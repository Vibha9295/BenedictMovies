//
//  Movie.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//

import Foundation

struct Movie: Identifiable, Codable, Equatable {  // Add Equatable conformance
    let id: Int
    let title: String
    let overview: String
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
    }
    
    var posterURL: URL? {
        guard let posterPath = posterPath else { return nil }
        return URL(string: "\(Constants.baseImageURL)\(posterPath)")
    }
}
