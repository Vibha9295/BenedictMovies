//
//  MockMovieListViewModel.swift
//  BenedictMoviesTests
//
//  Created by Mac on 16/07/24.
//

import Foundation
import SwiftUI
import Combine
@testable import BenedictMovies

class MockMovieListViewModel: MovieListViewModelProtocol {
    @Published var isLoading: Bool = false
    @Published var movies: [Movie] = []
    
    func fetchBenedictMovies() {
        isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.movies = [
                Movie(id: 1, title: "Movie 1", overview: "Overview 1", posterPath: nil),
                Movie(id: 2, title: "Movie 2", overview: "Overview 2", posterPath: nil)
            ]
            self.isLoading = false
        }
    }
}
