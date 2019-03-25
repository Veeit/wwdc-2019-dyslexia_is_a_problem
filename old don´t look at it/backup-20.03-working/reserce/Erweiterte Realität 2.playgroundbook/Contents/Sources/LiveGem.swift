//
//  LiveGem.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation

public class LiveGem: VirtualObject {
    
    override var type: VirtualObjectType { return .gem }
    
    override var placeableObject: PlaceableObject {
        let object = super.placeableObject
        return object
    }
    
    override var customAccessibilityDescription: String {
        return NSLocalizedString("Gem", comment: "Localizable and accessible gem description")
    }
    
    private let assetsPath: String = "Models.scnassets/gem"

    public init(id: String? = nil) {
        super.init(path: assetsPath, modelName: "neutral", fileExtension: "scn", id: id)
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
