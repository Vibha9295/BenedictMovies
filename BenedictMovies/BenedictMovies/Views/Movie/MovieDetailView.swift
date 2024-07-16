//
//  MovieDetailView.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//
import SwiftUI
import SwiftUI

struct MovieDetailView: View {
    var movie: Movie
    @StateObject private var viewModel: MovieDetailViewModel
    
    init(movie: Movie) {
        self.movie = movie
        _viewModel = StateObject(wrappedValue: MovieDetailViewModel(apiClient: APIClient.shared))
    }
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                if let posterURL = movie.posterURL {
                    AsyncImageView(url: posterURL)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)
                        .shadowStyle(radius: 5)
                        .foregroundColor(.gray)
                }
                
                Text(movie.overview)
                    .font(.body)
                    .foregroundColor(.primary)
                    .padding([.leading, .trailing, .bottom])
                
                Text("Similar Movies")
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.horizontal)
                
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .padding()
                } else if viewModel.isLoading {
                    LoaderView()
                } else if viewModel.similarMovies.isEmpty {
                    EmptyView(message: "No Similar Movies")
                } else {
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 16) {
                            ForEach(viewModel.similarMovies) { similarMovie in
                                SimilarMovieRow(movie: similarMovie)
                                    .frame(width: 120)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 220)
                }
            }
        }
        .navigationTitle(movie.title)
        .accessibilityIdentifier("MovieDetailView")

        .task {
            await viewModel.fetchSimilarMovies(for: movie)
        }
    }
}
