//
//  APIClientTests.swift
//  BenedictMoviesTests
//
//  Created by Mac on 16/07/24.
//

import Foundation
import XCTest
@testable import BenedictMovies
class APIClientTests: XCTestCase {
    
    var apiClient: APIClient!
    var mockSession: MockURLSession!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockSession = MockURLSession()
        apiClient = APIClient(session: mockSession)
    }
    
    override func tearDownWithError() throws {
        mockSession = nil
        apiClient = nil
        try super.tearDownWithError()
    }
    
    func testFetchMovies_Success() async throws {
        // Arrange
        let expectedMovieResponse = MovieResponse(results: [Movie(id: 1, title: "Movie 1", overview: "Overview 1", posterPath: nil)])
        
        let jsonData = try JSONEncoder().encode(expectedMovieResponse)
        mockSession.dataResponse = (jsonData, HTTPURLResponse(url: URL(string: "https://example.com")!, statusCode: 200, httpVersion: nil, headerFields: nil), nil)
        
        // Act
        let fetchedMovieResponse = try await apiClient.fetchMovies(from: "https://example.com")
        
        // Assert
        XCTAssertEqual(fetchedMovieResponse.results.count, expectedMovieResponse.results.count)
        XCTAssertEqual(fetchedMovieResponse.results.first?.title, expectedMovieResponse.results.first?.title)
    }
    
    
}
