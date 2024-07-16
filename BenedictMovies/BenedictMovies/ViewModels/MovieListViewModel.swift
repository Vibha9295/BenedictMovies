//
//  MovieListViewModel.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//
import Foundation
import SwiftUI
import Combine

protocol MovieListViewModelProtocol: ObservableObject {
    var isLoading: Bool { get }
    var movies: [Movie] { get }
    
    func fetchBenedictMovies()
}

class MovieListViewModel: MovieListViewModelProtocol {
    @Published var movies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let apiClient: APIClientProtocol
    private var cancellables = Set<AnyCancellable>()
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }
    
    func fetchBenedictMovies() {
        isLoading = true
        
        let urlString = constructBenedictMoviesURL()
        Task {
            do {
                let movieResponse = try await apiClient.fetchMovies(from: urlString)
                
                DispatchQueue.main.async {
                    self.movies = movieResponse.results
                    self.errorMessage = nil
                    self.isLoading = false
                }
            } catch {
                let apiError = error as? APIError ?? .networkError(URLError(.unknown))
                
                DispatchQueue.main.async {
                    self.errorMessage = apiError.localizedDescription
                    self.isLoading = false
                }
            }
        }
    }
    
    private func constructBenedictMoviesURL() -> String {
        "\(Constants.discoverMoviesURL)\(Constants.apiKey)&with_people=71580"
    }
}


