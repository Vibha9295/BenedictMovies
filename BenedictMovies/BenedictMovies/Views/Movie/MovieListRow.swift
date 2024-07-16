//
//  MovieListRow.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//

import SwiftUI

struct MovieListRow: View {
    var movie: Movie
    
    var body: some View {
        HStack {
            if let posterURL = movie.posterURL {
                AsyncImageView(url: posterURL)
                    .frame(width: 70, height: 105)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .accessibilityIdentifier("MoviePosterImage_\(movie.id)")
            } else {
                Image(systemName: "photo")
                    .resizable()
                    .frame(width: 70, height: 105)
                    .cornerRadius(10)
                    .shadow(radius: 5)
                    .foregroundColor(.gray)
                    .accessibilityIdentifier("MoviePosterImage_\(movie.id)")
            }
            
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                    .accessibilityIdentifier("MovieTitle_\(movie.id)")
                
                Text(movie.overview)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
                    .lineLimit(2)
            }
            .padding(.leading, 10)
        }
        .padding(.vertical, 10)
        .listRowBackground(Color.clear)
        .accessibilityIdentifier("MovieRow_\(movie.id)")
    }
}
