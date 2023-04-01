//
//  AudioPlayer.swift
//  Restart
//
//  Created by Tiago Almeida de Oliveira on 31/03/23.
//

import AVFoundation
import Foundation

var audioPlayer: AVAudioPlayer?

enum AudioPlayList: String {
    case chimeup
    case success

    var type: String {
        switch self {
        case .chimeup:
            return "mp3"

        case .success:
            return "m4a"
        }
    }
}

func playSound(sound: AudioPlayList) {
    if let path = Bundle.main.path(forResource: sound.rawValue, ofType: sound.type) {
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: path))
            audioPlayer?.play()
        } catch {
            print("Could not play the sound file.")
        }
    }
}
