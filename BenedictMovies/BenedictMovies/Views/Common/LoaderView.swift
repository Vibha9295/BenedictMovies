//
//  LoaderView.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//

import SwiftUI
struct LoaderView: View {
    var label: String = Constants.loadingMessageKey
    
    var body: some View {
        ProgressView(label)
            .progressViewStyle(CircularProgressViewStyle())
            .padding()
            .background(Color(.systemBackground).opacity(0.8))
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}
