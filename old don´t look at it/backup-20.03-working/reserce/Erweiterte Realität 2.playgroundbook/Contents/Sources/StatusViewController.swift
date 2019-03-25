//
//  StatusViewController.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import ARKit

/**
 Displayed at the top of the main interface of the app that allows users to see
 the status of the AR experience, as well as the ability to control restarting
 the experience altogether.
 - Tag: StatusViewController
 */
@objc(StatusViewController)
public class StatusViewController: UIViewController {
    // MARK: - Types
    
    enum MessageType {
        case trackingStateEscalation
        case planeEstimation
        case contentPlacement
        case focusSquare
        
        static var all: [MessageType] = [
            .trackingStateEscalation,
            .planeEstimation,
            .contentPlacement,
            .focusSquare
        ]
    }
    
    // MARK: - IBOutlets
    
    @IBOutlet weak private var messagePanel: UIVisualEffectView!
    
    @IBOutlet weak private var messageLabel: UILabel!
    
    // MARK: - Properties
    
    /// Trigerred when the "Restart Experience" button is tapped.
    var restartExperienceHandler: () -> Void = {}
    
    /// Seconds before the timer message should fade out. Adjust if the app needs longer transient messages.
    private let displayDuration: TimeInterval = 6
    
    // Timer for hiding messages.
    private var messageHideTimer: Timer?
    
    private var timers: [MessageType: Timer] = [:]
    
    // MARK: - Message Handling
    
    func showMessage(_ text: String, autoHide: Bool = true) {
        // Cancel any previous hide timer.
        messageHideTimer?.invalidate()
        
        messageLabel.text = text
        
        // Make sure status is showing.
        setMessageHidden(false, animated: true)
        
        if autoHide {
            messageHideTimer = Timer.scheduledTimer(withTimeInterval: displayDuration, repeats: false, block: { [weak self] _ in
                self?.setMessageHidden(true, animated: true)
            })
        }
    }
    
    func scheduleMessage(_ text: String, inSeconds seconds: TimeInterval, messageType: MessageType) {
        cancelScheduledMessage(for: messageType)
        
        let timer = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false, block: { [weak self] timer in
            self?.showMessage(text)
            timer.invalidate()
        })
        
        timers[messageType] = timer
    }
    
    func cancelScheduledMessage(`for` messageType: MessageType) {
        timers[messageType]?.invalidate()
        timers[messageType] = nil
    }
    
    func cancelAllScheduledMessages() {
        for messageType in MessageType.all {
            cancelScheduledMessage(for: messageType)
        }
    }
    
    // MARK: - ARKit
    
    func showTrackingQualityInfo(for trackingState: ARCamera.TrackingState, autoHide: Bool) {
        showMessage(trackingState.presentationString, autoHide: autoHide)
        
        // Tell VoiceOver to alert the user the status has updated
        let axStatusAlert = String.localizedStringWithFormat(NSLocalizedString("Tracking Status Change: %@", comment: "AX notification for status alert change."), trackingState.presentationString)
        UIAccessibility.post(notification: .screenChanged, argument: axStatusAlert)
    }
    
    func escalateFeedback(for trackingState: ARCamera.TrackingState, inSeconds seconds: TimeInterval) {
        cancelScheduledMessage(for: .trackingStateEscalation)
        
        let timer = Timer.scheduledTimer(withTimeInterval: seconds, repeats: false, block: { [unowned self] _ in
            self.cancelScheduledMessage(for: .trackingStateEscalation)
            
            var message = trackingState.presentationString
            if let recommendation = trackingState.recommendation {
                message.append(": \(recommendation)")
            }
            
            self.showMessage(message, autoHide: false)
        })
        
        timers[.trackingStateEscalation] = timer
    }
    
    // MARK: - IBActions
    
    @IBAction private func restartExperience(_ sender: UIButton) {
        restartExperienceHandler()
    }
    
    // MARK: - Panel Visibility
    
    private func setMessageHidden(_ hide: Bool, animated: Bool) {
        // The panel starts out hidden, so show it before animating opacity.
        messagePanel.isHidden = false
        
        guard animated else {
            messagePanel.alpha = hide ? 0 : 1
            return
        }
        
        UIView.animate(withDuration: 0.2, delay: 0, options: [.beginFromCurrentState], animations: {
            self.messagePanel.alpha = hide ? 0 : 1
        }, completion: nil)
    }
}

extension ARCamera.TrackingState {
    var presentationString: String {
        switch self {
        case .notAvailable:
            return NSLocalizedString("TRACKING UNAVAILABLE", comment: "Tracking unavailable string")
        case .normal:
            return NSLocalizedString("TRACKING NORMAL", comment: "Tracking normal string")
        case .limited(.excessiveMotion):
            return NSLocalizedString("TRACKING LIMITED\nExcessive motion", comment: "Tracking limited motion string")
        case .limited(.insufficientFeatures):
            return NSLocalizedString("TRACKING LIMITED\nLow detail", comment: "Tracking limited detail string")
        case .limited(.initializing):
            return NSLocalizedString("Initializing", comment: "Tracking initializing string")
        default: // .limited(.relocalizing) added in 11.3
            return NSLocalizedString("TRACKING LIMITED", comment: "Tracking other string")
        }
    }
    
    var recommendation: String? {
        switch self {
        case .limited(.excessiveMotion):
            return NSLocalizedString("Try slowing down your movement, or stop your code, and then run it again.", comment: "Slow down movement string")
        case .limited(.insufficientFeatures):
            return NSLocalizedString("Try pointing at a flat surface, or stop your code, and then run it again.", comment: "Flat surface string")
        default:
            return nil
        }
    }
}

