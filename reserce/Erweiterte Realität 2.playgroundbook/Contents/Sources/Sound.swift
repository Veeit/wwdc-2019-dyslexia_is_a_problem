// 
//  Sound.swift
//
//  Copyright © 2017,2018 Apple Inc. All rights reserved.
//

import Foundation
import AVFoundation

var audioController = AudioController()

class AudioController: NSObject, AVAudioPlayerDelegate {
    
    var activeAudioPlayers = Set<AVAudioPlayer>()
    
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        activeAudioPlayers.remove(player)
    }
    
    func register(_ player: AVAudioPlayer) {
        activeAudioPlayers.insert(player)
        player.delegate = self
    }
}


/// Plays the given sound. Optionally specify a volume from 0 (silent) to 100 (loudest), with 80 being the default.
///
/// - Parameter sound: The sound to be played.
/// - Parameter volume: The volume at which the sound is to be played (0 to 100).
///
/// - localizationKey: playSound(_:volume:)
public func playSound(_ sound: Sound, volume: Int = 80) {
    
    guard let url = sound.url else { return }
    
    do {
        let audioPlayer = try AVAudioPlayer(contentsOf: url)
        audioPlayer.volume = Float(max(min(volume, 100), 0)) / 100.0
        audioController.register(audioPlayer)
        audioPlayer.play()
    } catch {}
}

/// An enumeration of all the different sounds that can be played.
///
/// - localizationKey: Sound
public enum Sound {
    
    case bluDance, bluLookAround, bluHeadScratch, bluOops, boing, data, electricity, hat, pop, snare, tennis, tick, tumble, wap
    
    var url : URL? {
        
        var fileName: String?
        
        switch self {
        case .bluDance:
            fileName = "Blu_CelebrationDance"
        case .bluLookAround:
            fileName = "Blu_BreatheLookAround"
        case .bluHeadScratch:
            fileName = "Blu_HeadScratch"
        case .bluOops:
            fileName = "Blu_AlmostFallOffEdge"
        case .boing:
            fileName = "Cartoon Space Boing"
        case .data:
            fileName = "Computer Data 02"
        case .electricity:
            fileName = "Electricity Surge"
        case .hat:
            fileName = "Vox Kit 1 Hat 069"
        case .pop:
            fileName = "Bottle Cork"
        case .snare:
            fileName = "Vox Kit 1 Snare 068"
        case .tennis:
            fileName = "Tennis Serve"
        case .tick:
            fileName = "Clock Tick"
        case .tumble:
            fileName = "Cartoon Tumble Down"
        case .wap:
            fileName = "Comedy Wap"
        }
        guard let resourceName = fileName else { return nil }
        
        return Bundle.main.url(forResource: resourceName, withExtension: "wav")
    }
}

