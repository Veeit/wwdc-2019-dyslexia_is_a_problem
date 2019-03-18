//
//  Gem.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation

public class Gem : PlaceableObject {
    
    override public init() {
        super.init()
        self.type = VirtualObjectType.gem
        self.name = NSLocalizedString("Gem", comment: "Localized gem name")
    }

    public override func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)
    }

    required public init(from decoder: Decoder) throws {
        try super.init(from: decoder)
    }
}
