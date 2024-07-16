//
//  ImageLoader.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
import Combine
import UIKit

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    
    private var url: URL
    private var cancellables = Set<AnyCancellable>()
    
    init(url: URL, session: URLSession = .shared) {
        self.url = url
        loadImage(session: session)
    }
    
    func loadImage(session: URLSession) {
        session.dataTaskPublisher(for: url)
            .map(\.data)
            .compactMap(UIImage.init(data:))
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { _ in
            }, receiveValue: { [weak self] in
                self?.image = $0
            })
            .store(in: &cancellables) 
    }
}
