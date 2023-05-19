//
//  PlaySound.swift
//  Credit-App
//
//  Created by Abdelrahman Shehab on 14/04/2023.
//

import Foundation

import AVFoundation

var audioPlayer: AVAudioPlayer?

func playSound(sound:String, type: String) {
    
    if let path = Bundle.main.path(forResource: sound, ofType: type) {
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not find and play the sound.")
        }
    }
}
