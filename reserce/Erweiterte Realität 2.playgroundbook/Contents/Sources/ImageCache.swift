//
//  ImageCache.swift
//
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import UIKit

class ImageCache {
    
    static let shared = ImageCache()
    
    private var images = [Int: UIImage]()

    func add(_ image: UIImage, for identifier: Int) {
        images[identifier] = image
    }
    
    func getImageWith(identifier: Int) -> UIImage? {
        return images[identifier]
    }
    
    func removeImageWith(identifier: Int) {
        images.removeValue(forKey: identifier)
    }
}

class ImageIdentifierCache {
    
    static let shared = ImageIdentifierCache()
    
    private var identifiers = [Int: Int]()
    
    func add(_ identifier: Int) {
        identifiers[identifier] = identifier
    }
    
    func contains(identifier: Int) -> Bool {
        return identifiers.keys.contains(identifier)
    }
    
    func remove(_ identifier: Int) {
        identifiers.removeValue(forKey: identifier)
    }
}
