//
//  MovieDetailViewModel.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//
import Foundation

@MainActor
class MovieDetailViewModel: ObservableObject {
    @Published var similarMovies: [Movie] = []
    @Published var isLoading: Bool = false
    @Published var errorMessage: String? = nil
    
    private let apiClient: APIClientProtocol
    
    init(apiClient: APIClientProtocol = APIClient.shared) {
        self.apiClient = apiClient
    }

    func fetchSimilarMovies(for movie: Movie) async {
        isLoading = true
        defer { isLoading = false }
        let urlString = "\(Constants.similarMoviesURL)\(movie.id)/similar?api_key=\(Constants.apiKey)"
        do {
            let movieResponse = try await apiClient.fetchMovies(from: urlString)
            similarMovies = movieResponse.results
            errorMessage = nil
        } catch {
            let apiError = error as? APIError ?? .networkError(URLError(.unknown))
            errorMessage = apiError.localizedDescription
        }
    }
}
