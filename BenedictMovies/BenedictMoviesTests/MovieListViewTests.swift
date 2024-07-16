//
//  MovieListViewTests.swift
//  BenedictMoviesTests
//
//  Created by Mac on 16/07/24.
//

import Foundation
import XCTest
@testable import BenedictMovies
class MovieListViewTests: XCTestCase {
    
    func testMovieListView_WhenLoading_ShowLoaderView() {
        // Given
        let viewModel = MockMovieListViewModel()
        // When
        viewModel.fetchBenedictMovies()
        
        // Then
        XCTAssertTrue(viewModel.isLoading, "Expected loading state to be true initially")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertFalse(viewModel.isLoading, "Expected loading state to be false after fetching movies")
        }
    }
    
    func testMovieListView_WhenNoMoviesAvailable_ShowEmptyView() {
        // Given
        let viewModel = MockMovieListViewModel()
        
        // When
        viewModel.fetchBenedictMovies()
        
        // Then
        XCTAssertTrue(viewModel.isLoading, "Expected loading state to be true initially")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertFalse(viewModel.isLoading, "Expected loading state to be false after fetching movies")
            XCTAssertTrue(viewModel.movies.isEmpty, "Expected movies array to be empty")
        }
    }
    
    func testMovieListView_WhenMoviesAvailable_ShowMovieList() {
        // Given
        let viewModel = MockMovieListViewModel()
        
        // When
        viewModel.fetchBenedictMovies()
        
        // Then
        XCTAssertTrue(viewModel.isLoading, "Expected loading state to be true initially")
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            XCTAssertFalse(viewModel.isLoading, "Expected loading state to be false after fetching movies")
            XCTAssertFalse(viewModel.movies.isEmpty, "Expected movies array to not be empty")
        }
    }
}
