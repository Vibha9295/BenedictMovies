//
//  ImageCache.swift
//  BenedictMovies
//
//  Created by Mac on 15/07/24.
//

import Foundation
import UIKit

class ImageCache {
    static let shared = ImageCache()
    private var cache = NSCache<NSURL, UIImage>()
    
    func getImage(for url: URL) -> UIImage? {
        return cache.object(forKey: url as NSURL)
    }
    
    func saveImage(_ image: UIImage, for url: URL) {
        cache.setObject(image, forKey: url as NSURL)
    }
}
