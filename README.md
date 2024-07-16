# BenedictMovies
BenedictMovies is a SwiftUI-based iOS app that allows users to discover and explore movies. It fetches data from The Movie Database (TMDb) API to display popular movies, movie details, and similar movies.

# Features
View a list of popular movies
View movie details including poster, overview, and similar movies
Async loading of images and handling of loading states
Error handling for network requests

# Setup
To run BenedictMovies on your local machine, follow these steps:

Clone the repository:

bash
Copy code
git clone https://github.com/yourusername/BenedictMovies.git
cd BenedictMovies
Install dependencies:

This project uses Swift Package Manager for dependencies. Xcode should automatically resolve and download the necessary packages upon opening the project.

API Key:

The app requires an API key from The Movie Database (TMDb). You can obtain a key by signing up at TMDb website and replace Constants.apiKey in APIClient.swift.

Open the project:

Open BenedictMovies.xcodeproj in Xcode.

Run the app:

Select a simulator (e.g., iPhone 12 Pro) and press Cmd + R to build and run the app.

Dependencies
SwiftUI
Combine
