//
//  Constants.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//

import Foundation

enum Constants {
    static let apiKey = "5f10a51d7ab83ad724ecd08135afdcd0"
    static let baseURL: String = "https://api.themoviedb.org/3"
    
    static let baseImageURL = "https://image.tmdb.org/t/p/w500"
    static let discoverMoviesURL = "https://api.themoviedb.org/3/discover/movie?api_key="
    static let similarMoviesURL = "https://api.themoviedb.org/3/movie/"
    
    // Error Messages
    static let invalidURLError: String = "The URL provided is invalid."
    static let noDataError: String = "No data received from the server."
    static let requestFailedError: String = "Request failed with status code: "
    static let decodingError: String = "Failed to decode response: "
    static let networkError: String = "Network error: "
    // Localization Keys
    static let loadingMessageKey: String = "Loading..."
    
}
