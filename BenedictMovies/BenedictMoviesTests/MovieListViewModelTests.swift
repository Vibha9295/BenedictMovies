//
//  MovieListViewModelTests.swift
//  BenedictMoviesTests
//
//  Created by Mac on 16/07/24.
//

import Foundation
import XCTest
@testable import BenedictMovies

class MovieListViewModelTests: XCTestCase {
    
    var viewModel: MovieListViewModel!
    var mockAPIClient: MockAPIClient!
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        mockAPIClient = MockAPIClient()
        viewModel = MovieListViewModel(apiClient: mockAPIClient)
    }
    
    override func tearDownWithError() throws {
        mockAPIClient = nil
        viewModel = nil
        try super.tearDownWithError()
    }
    
    func testFetchBenedictMovies_Success() async throws {
        // Arrange
        let expectedMovies = [Movie(id: 1, title: "Movie 1", overview: "Overview 1", posterPath: "path/to/poster")]
        mockAPIClient.mockMovies = expectedMovies // Mock response
        
        let expectation = XCTestExpectation(description: "Fetch movies")
        
        // Act
        viewModel.fetchBenedictMovies()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            expectation.fulfill()
        }
        // Assert
        await fulfillment(of: [expectation], timeout: 5)

    }
    
    
    
}
