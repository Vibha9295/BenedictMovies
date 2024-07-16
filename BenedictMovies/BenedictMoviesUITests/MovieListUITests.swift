//
//  MovieListUITests.swift
//  BenedictMoviesUITests
//
//  Created by Mac on 16/07/24.
//

import Foundation
import XCTest

final class MovieListUITests: XCTestCase {

    func testMovieListNavigation() {
        let app = XCUIApplication()
        app.launch()

        // Ensure MoviesListView exists
        let moviesListView = app.otherElements["MoviesListView"]
        XCTAssertTrue(moviesListView.waitForExistence(timeout: 20), "Movies list view should exist")
    }
}
