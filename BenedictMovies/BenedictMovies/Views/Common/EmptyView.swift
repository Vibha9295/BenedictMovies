//
//  EmptyView.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//

import SwiftUI
struct EmptyView: View {
    var message: String = "No Movies Available"
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.gray)
            Text(message)
                .foregroundColor(.gray)
                .font(.headline)
        }
        .accessibilityIdentifier("NoMoviesAvailableText")
    }
}
