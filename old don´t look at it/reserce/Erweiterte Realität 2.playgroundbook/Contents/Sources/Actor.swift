//
//  Actor.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import PlaygroundSupport

public enum ActorAction: String, Codable {
    case turnRight
    case turnLeft
    case jump
}

public enum Trigger: String, Codable {
    case reactBehind
    case reactLeft
    case reactRight
    case reactTooClose
}

public class Actor: PlaceableObject {
    
    public let characterName: CharacterName
    
    public init(name: CharacterName) {
        if name == .octet {
            characterName = .byte
        } else {
            characterName = name
        }
        super.init()
        self.name = characterName.rawValue
        self.type = VirtualObjectType.actor
    }
    
    internal init(id: String, name: CharacterName) {
        if name == .octet {
            characterName = .byte
        } else {
            characterName = name
        }
        super.init()
        self.id = id
        self.name = characterName.rawValue
        self.type = VirtualObjectType.actor
    }

    public var reactBehind = [ActorAction]() {
        didSet {
            sendActorActionsToLiveView(trigger: .reactBehind, actions: reactBehind)
        }
    }
    
    public var reactOnLeft = [ActorAction]() {
        didSet {
            sendActorActionsToLiveView(trigger: .reactLeft, actions: reactOnLeft)
        }
    }
    
    public var reactOnRight = [ActorAction]() {
        didSet {
            sendActorActionsToLiveView(trigger: .reactRight, actions: reactOnRight)
        }
    }
    
    public var reactTooClose = [ActorAction]() {
        didSet {
            sendActorActionsToLiveView(trigger: .reactTooClose, actions: reactTooClose)
        }
    }
    
    private func sendActorActionsToLiveView(trigger: Trigger, actions: [ActorAction]) {
        guard let proxy = PlaygroundPage.current.liveView as? PlaygroundRemoteLiveViewProxy else { return }
        
        proxy.send(
            PlaygroundMessageToLiveView.setActorActions(actor: self, trigger: trigger, actions: actions).playgroundValue
        )
    }

    // MARK: - Codable implementation.

    private enum CodingKeys: String, CodingKey {
        case characterName
    }

    required public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        characterName = try values.decode(CharacterName.self, forKey: .characterName)

        try super.init(from: decoder)
    }

    override public func encode(to encoder: Encoder) throws {
        try super.encode(to: encoder)

        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(characterName, forKey: .characterName)
    }
}
