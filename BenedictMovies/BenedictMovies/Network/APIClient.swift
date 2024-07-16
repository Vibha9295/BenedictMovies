//
//  APIClient.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.

//
import Foundation

enum APIError: LocalizedError {
    case invalidURL
    case noData
    case requestFailed(Int)
    case decodingError(Error)
    case networkError(URLError)

    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return Constants.invalidURLError
        case .noData:
            return Constants.noDataError
        case .requestFailed(let statusCode):
            return "\(Constants.requestFailedError)\(statusCode)."
        case .decodingError(let error):
            return "\(Constants.requestFailedError)\(error.localizedDescription)"
        case .networkError(let urlError):
            return "\(Constants.networkError)\(urlError.localizedDescription)"
        }
    }
}

protocol APIClientProtocol {
    func fetchMovies(from urlString: String) async throws -> MovieResponse
}

class APIClient: APIClientProtocol {
    private let session: URLSessionProtocol

    static let shared = APIClient(session: URLSession.shared)

    init(session: URLSessionProtocol) {
        self.session = session
    }

    func fetchMovies(from urlString: String) async throws -> MovieResponse {
        guard let url = URL(string: urlString) else {
            throw APIError.invalidURL
        }

        do {
            let (data, response) = try await session.data(for: URLRequest(url: url))

            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.noData
            }

            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.requestFailed(httpResponse.statusCode)
            }

            let movieResponse = try JSONDecoder().decode(MovieResponse.self, from: data)
            return movieResponse

        } catch {
            if let urlError = error as? URLError {
                throw APIError.networkError(urlError)
            } else {
                throw error
            }
        }
    }
}

protocol URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse)
}

extension URLSession: URLSessionProtocol {
    func data(for request: URLRequest) async throws -> (Data, URLResponse) {
        let (data, response) = try await self.data(for: request, delegate: nil)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw APIError.noData
        }
        guard (200...299).contains(httpResponse.statusCode) else {
            throw APIError.requestFailed(httpResponse.statusCode)
        }
        return (data, response)
    }
}
