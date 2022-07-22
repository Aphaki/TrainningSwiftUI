//
//  AVPlayerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/07/23.
// https://www.freesoundslibrary.com/

import SwiftUI
import AVKit

class AVAudioPlayerManager {
    
    static let shared = AVAudioPlayerManager()
    
    var player: AVAudioPlayer?
    
    func playSound(name: String) {
        guard let url = Bundle.main.url(forResource: name, withExtension: ".mp3") else { return }
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player?.play()
        } catch let error {
            print("playSound error: \(error.localizedDescription)")
        }
        
    }
    
}

struct AVAudioPlayerBootcamp: View {
    var body: some View {
        VStack(spacing: 40) {
            Button("pop sound".uppercased()) { AVAudioPlayerManager.shared.playSound(name: "pop") }
            Button("punch sound".uppercased()) { AVAudioPlayerManager.shared.playSound(name: "punch") }
        }
        
    }
}

struct AVAudioPlayerManager_Previews: PreviewProvider {
    static var previews: some View {
        AVAudioPlayerBootcamp()
    }
}
