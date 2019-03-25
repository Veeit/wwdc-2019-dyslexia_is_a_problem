//
//  PlaygroundExtras.swift
//
//  Copyright © 2018 Apple Inc. All rights reserved.
//

import Foundation

public enum Environment: String {
    case live
    case user
}

public enum Process {
    private(set) static var environment: Environment = .user
    
    public static var isLive: Bool { return environment == .live }
    public static func setIsLive() { environment = .live }
    public static var isUser: Bool { return environment == .user }
    public static func setIsUser() { environment = .user }
    
    public static var isLiveViewConnectionOpen = false
}

// MARK: Logging

private var logCounter = 0

public func PBLog(_ message: String = "", source: String = #file, caller: String = #function) {
    let processId = Process.isLive ? "LVP" : "UP"
    
    let fileName = URL(string: source)?.lastPathComponent ?? ""
    
    let prefixedString = "PBLog: <#\(logCounter): \(processId)>-\(fileName)-\(caller) " + message
    NSLog(prefixedString)
    
    logCounter += 1
}
