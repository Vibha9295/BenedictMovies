//
//  BenedictMoviesApp.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//

import SwiftUI

@main
struct BenedictMoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(MovieListViewModel(apiClient: APIClient.shared))
        }
    }
}
