//
//  SimilarMovieRow.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//
import SwiftUI

struct SimilarMovieRow: View {
    var movie: Movie
    
    var body: some View {
        NavigationLink(destination: MovieDetailView(movie: movie)) {
            VStack {
                if let posterURL = movie.posterURL {
                    AsyncImageView(url: posterURL)
                        .frame(width: 120, height: 180)
                        .cornerRadius(10)
                        .padding(.horizontal, 8)
                } else {
                    Image(systemName: "photo")
                        .resizable()
                        .frame(width: 120, height: 180)
                        .cornerRadius(10)
                        .padding(.horizontal, 8)
                }
                Text(movie.title)
                    .font(.caption)
                    .foregroundColor(.primary)
                    .lineLimit(1)
            }
            .frame(width: 120)
        }
    }
}
