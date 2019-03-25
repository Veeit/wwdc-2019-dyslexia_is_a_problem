//
//  Shape.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import UIKit
import PlaygroundSupport

public typealias Image = UIImage

public class Shape: PlaceableObject {
    
    private let maximumImageSize = CGSize(width: 512, height: 512)
    
    public let shapeType: ShapeType
    
    public var color: UIColor = UIColor.lightGray {
        
        didSet {
            
            guard let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else { return }
            
            proxy.send(
                PlaygroundMessageToLiveView.setObjectColor(object: self, color: color).playgroundValue
            )
        }
    }
    
    public var image: Image = UIImage() {
        
        didSet {
            guard (image.size.width > 0) && (image.size.height > 0) else { return }
            guard let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else { return }

            let imageIdentifier = ObjectIdentifier(image).hashValue
            
            // Check if the image is in the cache.
            if !ImageIdentifierCache.shared.contains(identifier: imageIdentifier) {
                
                // Image is not cached => scale it and send it to the live view where it will be cached.
                // Note: this should happen synchronously so that the setObjectImage message sent below will have a cached image to apply.
                
                // If image does not fit within maximumImageSize, then scale it so that it does.
                // This also has the benefit of setting image orientation to its default (up).
                var desiredImageSize = self.image.size
                if (self.image.size.width > self.maximumImageSize.width) || (self.image.size.height > self.maximumImageSize.height) {
                    desiredImageSize = self.maximumImageSize
                }
                
                // Scale the image to fit desired size.
                let newImage = self.image.scaledToFit(within: desiredImageSize)
                
                // Cache the identifier image.
                ImageIdentifierCache.shared.add(imageIdentifier)
                
                // Send the cached image to the live view.
                proxy.send(
                    PlaygroundMessageToLiveView.setCachedImage(imageID: imageIdentifier, image: newImage).playgroundValue
                )
            }
            
            // Confirm that the image is available in the cache.
            guard ImageIdentifierCache.shared.contains(identifier: imageIdentifier) else { return }
            
            // Send a message to the live view to update the object with the cached image.
            proxy.send(
                PlaygroundMessageToLiveView.setObjectImage(object: self, imageID: imageIdentifier).playgroundValue
            )
        }
    }
    
    public init(type: ShapeType) {
        shapeType = type
        super.init()
        self.name = shapeType.rawValue
        self.type = VirtualObjectType.shape
    }

    // MARK: - Codable implementation.

    private enum CodingKeys: String, CodingKey {
        case shapeType
    }

    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        shapeType = try values.decode(ShapeType.self, forKey: .shapeType)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(shapeType, forKey: .shapeType)
    }
}
