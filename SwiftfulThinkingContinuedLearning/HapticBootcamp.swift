//
//  HapticBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/07/21.
//

import SwiftUI

class HapticManager {
    static let shared = HapticManager()
    
    func notification(feedbackType: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(feedbackType)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
    
    func selection() {
        let generator = UISelectionFeedbackGenerator()
        generator.selectionChanged()
    }
}

struct HapticBootcamp: View {
    var body: some View {
        VStack(spacing: 15) {
            Group {
                Button("success".uppercased())
                { HapticManager.shared.notification(feedbackType: .success) }
                Button("error".uppercased())
                { HapticManager.shared.notification(feedbackType: .error) }
                Button("warning".uppercased())
                { HapticManager.shared.notification(feedbackType: .warning) }
            }
            Divider().frame(height:1).background(.gray)
            Group {
                Button("heavy".uppercased()) { HapticManager.shared.impact(style: .heavy) }
                Button("medium".uppercased()) { HapticManager.shared.impact(style: .medium) }
                Button("light".uppercased()) { HapticManager.shared.impact(style: .light) }
                Button("rigid".uppercased()) { HapticManager.shared.impact(style: .rigid) }
                Button("soft".uppercased()) { HapticManager.shared.impact(style: .soft) }
            }
            Divider().frame(height:1).background(.gray)
            Button("Selection".uppercased()) { HapticManager.shared.selection() }
        }
    }
}

struct HapticBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticBootcamp()
    }
}
