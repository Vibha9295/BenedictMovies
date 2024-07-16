//
//  MovieDetailViewUITests.swift
//  BenedictMoviesUITests
//
//  Created by Mac on 16/07/24.
//

import Foundation
import XCTest

import XCTest
@testable import BenedictMovies


class MovieDetailViewUITests: XCTestCase {

    func testMovieDetailView() throws {
        let app = XCUIApplication()
        app.launch()

        // Ensure app is launched and wait for MovieDetailTitle to appear
        XCTAssertTrue(app.staticTexts["MovieDetailTitle"].waitForExistence(timeout: 10), "Movie title should be displayed")

        // Verify navigation title
        XCTAssertTrue(app.navigationBars["Movie Title"].exists)

        // Verify movie overview
        XCTAssertTrue(app.staticTexts["Movie Overview"].exists)

        // Verify poster display (assuming identifiers are set correctly)
        XCTAssertTrue(app.images["Movie Poster"].exists || app.images["Placeholder Image"].exists)

        // Verify loading state and loader view
        XCTAssertTrue(app.otherElements["LoaderView"].exists)

        // Verify "No Similar Movies" message display (if applicable)
        XCTAssertFalse(app.staticTexts["No Similar Movies"].exists)

        // Verify error message display (if applicable)
        XCTAssertFalse(app.staticTexts["Error Message"].exists)
    }
}
