//
//  MovieListView.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//
import SwiftUI

struct MovieListView1: View {
    @StateObject private var viewModel: MovieListViewModel
    
    init(viewModel: MovieListViewModel = MovieListViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    LoaderView()
                        .accessibilityIdentifier("LoaderView")
                } else if viewModel.movies.isEmpty {
                    EmptyView()
                        .accessibilityIdentifier("NoMoviesAvailableText")
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieListRow(movie: movie)
                                .accessibilityIdentifier("MovieRow_\(movie.id)")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.clear)
                    }
                }
            }
            .navigationTitle("Movies")
            .accessibilityIdentifier("MoviesTitle")
        }
        .onAppear {
            viewModel.fetchBenedictMovies()
        }
    }
}
import SwiftUI

struct MovieListView: View {
    @StateObject private var viewModel = MovieListViewModel()

    var body: some View {
        NavigationView {
            Group {
                if viewModel.isLoading {
                    LoaderView()
                        .accessibilityIdentifier("LoaderView")
                } else if viewModel.movies.isEmpty {
                    EmptyView()
                        .accessibilityIdentifier("NoMoviesAvailableText")
                } else {
                    List(viewModel.movies) { movie in
                        NavigationLink(destination: MovieDetailView(movie: movie)) {
                            MovieListRow(movie: movie)
                                .accessibilityIdentifier("MovieRow_\(movie.id)")
                        }
                        .buttonStyle(PlainButtonStyle())
                        .listRowBackground(Color.clear)
                    }
                    .accessibilityIdentifier("MoviesTableView")
                }
            }
            .navigationTitle("Movies")
        }
        .accessibilityIdentifier("MoviesListView")
        .onAppear {
            viewModel.fetchBenedictMovies()
        }
    }
}
