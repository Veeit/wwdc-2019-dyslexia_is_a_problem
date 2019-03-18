//
//  PlaygroundMessage.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import PlaygroundSupport

/// Defines a type that can be sent between processes as a `PlaygroundValue`.
/// - localizationKey: PlaygroundMessage.protocol
public protocol PlaygroundMessage {
    associatedtype T: PlaygroundMessageType
 
    var messageType: T { get }

    init?(messageType: T, encodedPayload: Data?)

    func encodePayload() -> Data?
}

/// Defines a type that represents a specific type of message.
/// - localizationKey: PlaygroundMessageType
public protocol PlaygroundMessageType {
    init?(rawValue: String)
    var rawValue: String { get }
}

/// Extends `PlaygroundMessage` to add `PlaygroundValue` encoding.
/// - localizationKey: PlaygroundMessage
public extension PlaygroundMessage {
    
    /// An initializer to create a `PlaygroundMessage` from a `PlaygroundValue` that contains an encoded type and optional payload.
    /// - localizationKey: PlaygroundMessage(playgroundValue:)
    public init?(playgroundValue: PlaygroundValue) {
        // Extract the required values from the supplied PlaygroundValue.
        guard case let .array(values) = playgroundValue, !values.isEmpty else { fatalError("Expected an array of values") }
        guard case let .string(rawType) = values[0] else { fatalError("Unexpected Playground value type") }

        // Check if this is a supported type.
        guard let messageType = T(rawValue: rawType) else { return nil }

        // Extract any encoded payload.
        let encodedPayload: Data?
        if values.count > 1, case let .data(payload) = values[1] {
            encodedPayload = payload
        }
        else {
            encodedPayload = nil
        }

        self.init(messageType: messageType, encodedPayload: encodedPayload)
    }

    /// A `PlaygroundValue` representation of the message.
    /// - localizationKey: PlaygroundMessage.playgroundValue
    public var playgroundValue: PlaygroundValue {
        if let encodedPayload = self.encodePayload() {
            return .array([.string(messageType.rawValue), .data(encodedPayload)])
        }
        else {
            return .array([.string(messageType.rawValue)])
        }
    }
}
