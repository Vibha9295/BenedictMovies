//
//  MovieDetailViewModelTests.swift
//  BenedictMoviesTests
//
//  Created by Mac on 16/07/24.
//

import Foundation
import XCTest
@testable import BenedictMovies

class MovieDetailViewModelTests: XCTestCase {
    
    class MockAPIClient: APIClientProtocol {
        let expectedMovies: [Movie]
        let shouldFail: Bool
        
        init(expectedMovies: [Movie], shouldFail: Bool = false) {
            self.expectedMovies = expectedMovies
            self.shouldFail = shouldFail
        }
        
        func fetchMovies(from urlString: String) async throws -> MovieResponse {
            if shouldFail {
                throw APIError.networkError(URLError(.notConnectedToInternet))
            }
            return MovieResponse(results: expectedMovies)
        }
    }
    
    func testFetchSimilarMovies_Success() async throws {
        // Arrange
        let expectedSimilarMovies = [
            Movie(id: 1, title: "Movie 1", overview: "Overview 1", posterPath: "/poster1.jpg"),
            Movie(id: 2, title: "Movie 2", overview: "Overview 2", posterPath: "/poster2.jpg")
        ]
        
        let mockAPIClient = MockAPIClient(expectedMovies: expectedSimilarMovies)
        
        // Act
        let viewModel =  await MovieDetailViewModel(apiClient: mockAPIClient)
        
        let expectation = XCTestExpectation(description: "Fetch similar movies")
        
        await viewModel.fetchSimilarMovies(for: Movie(id: 123, title: "Test Movie", overview: "", posterPath: ""))
        
        // Assert
        await MainActor.run {
            XCTAssertEqual(viewModel.similarMovies.count, expectedSimilarMovies.count, "Expected number of similar movies to match")
            XCTAssertNil(viewModel.errorMessage, "Expected no error message")
            XCTAssertFalse(viewModel.isLoading, "Expected loading state to be false")
        }
        
        expectation.fulfill()
        
        // Wait for the expectation to be fulfilled
        await fulfillment(of: [expectation], timeout: 5)
    }
    
    
    func testFetchSimilarMovies_Failure() async throws {
        // Arrange
        let mockAPIClient = MockAPIClient(expectedMovies: [], shouldFail: true)
        
        // Act
        let viewModel = await MovieDetailViewModel(apiClient: mockAPIClient)
        
        let expectation = XCTestExpectation(description: "Fetch similar movies")
        
        await viewModel.fetchSimilarMovies(for: Movie(id: 123, title: "Test Movie", overview: "", posterPath: ""))
        
        // Assert
        await MainActor.run {
            XCTAssertEqual(viewModel.similarMovies.count, 0, "Expected no similar movies on error")
            XCTAssertFalse(viewModel.isLoading, "Expected loading state to be false")
        }
        
        expectation.fulfill()
        
        // Wait for the expectation to be fulfilled
        await fulfillment(of: [expectation], timeout: 5)
    }
    
}
