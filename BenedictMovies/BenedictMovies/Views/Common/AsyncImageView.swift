//
//  AsyncImageView.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//
import SwiftUI

struct AsyncImageView: View {
    @StateObject private var imageLoader: ImageLoader

    init(url: URL) {
        _imageLoader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        Group {
            if let image = imageLoader.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .accessibilityIdentifier("Image")
            } else {
                ProgressView()
                    .accessibilityIdentifier("ProgressView")
            }
        }
    }
}
