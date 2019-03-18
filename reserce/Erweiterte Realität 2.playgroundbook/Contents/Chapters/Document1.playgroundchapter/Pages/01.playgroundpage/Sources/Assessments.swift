//
//  Assessments.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//
import PlaygroundSupport
import UIKit
import AVFoundation

private let successString = NSLocalizedString("Whoa! The camera sees a whole lot of extra stuff! It’s using all kinds of computer vision [algorithms](glossary://algorithm) to find [planes](glossary://plane), [feature points](glossary://feature%20point), and objects in the scene. It uses a three-way set of [axes](glossary://axis) to determine left and right, up and down, and side to side. On the [next page](@next), you’ll learn how to work with one of the major building blocks of augmented reality: the plane.", comment:"Success message for first page.")
private let solutionString = NSLocalizedString("`enableCameraVision()`", comment:"Solution for first page.")
private let cameraVisionHint = NSLocalizedString("Is there a function in the shortcut bar that can help you turn on camera vision?", comment:"Hint for enableCameraVision method.")
private let cameraPermissionHint = NSLocalizedString("To complete this page you need to give permission to use the camera on your iPad. Please close this playground by going back to 'My Playgrounds'. Then open it again, run your code, and tap 'OK' when you’re asked if you want to use the camera.", comment: "Hint for permissions.")

public func assessmentPoint() -> PlaygroundPage.AssessmentStatus {
    let checker = ContentsChecker(contents: PlaygroundPage.current.text)
    
    var hints = [String]()
    
    if checker.functionCallCount(forName: "enableCameraVision") == 0 {
        hints.append(cameraVisionHint)
    }
    
    let status = AVCaptureDevice.authorizationStatus(for: .video)
    
    if status != .authorized && checker.functionCallCount(forName: "enableCameraVision") != 0 {
        hints.append(cameraPermissionHint)
        return .fail(hints: hints, solution: nil)
    }
    
    if !hints.isEmpty {
        // Show hints
        return .fail(hints: hints, solution: solutionString)
    } else {
        return .pass(message: successString)
    }
}
