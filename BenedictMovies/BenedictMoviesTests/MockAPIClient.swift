//
//  MockAPIClient.swift
//  BenedictMoviesTests
//
//  Created by Mac on 16/07/24.
//

import Foundation
import XCTest
@testable import BenedictMovies
class MockAPIClient1: APIClientProtocol {
    var mockMovies: [Movie]?
    
    func fetchMovies(from urlString: String) async throws -> MovieResponse {
        guard let mockMovies = mockMovies else {
            throw APIError.noData
        }
        return MovieResponse(results: mockMovies)
    }
}
class MockAPIClient: APIClientProtocol {
    var mockMovies: [Movie]?
    
    func fetchMovies(from urlString: String) async throws -> MovieResponse {
        guard let mockMovies = mockMovies else {
            throw NSError(domain: "MockAPIClient", code: 404, userInfo: [NSLocalizedDescriptionKey: "Mock movies not set"])
        }
        
        return MovieResponse(results: mockMovies)
    }
}

class MockURLSession: URLSessionProtocol {
    var dataResponse: (Data?, URLResponse?, Error?) = (nil, nil, nil)
    var asyncDataResponse: (Data?, URLResponse?, Error?)? = nil
    
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        guard let data = dataResponse.0, let response = dataResponse.1 else {
            throw NSError(domain: "MockURLSession", code: 500, userInfo: [NSLocalizedDescriptionKey: "Invalid mock data setup"])
        }
        return (data, response)
    }
}


