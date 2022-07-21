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
}

struct HapticBootcamp: View {
    var body: some View {
        VStack(spacing: 15) {
            Button("success".uppercased())
            { HapticManager.shared.notification(feedbackType: .success) }
            Button("error".uppercased())
            { HapticManager.shared.notification(feedbackType: .error) }
            Button("warning".uppercased())
            { HapticManager.shared.notification(feedbackType: .warning) }
            Divider()
            Button("heavy".uppercased()) { HapticManager.shared.impact(style: .heavy) }
            Button("medium".uppercased()) { HapticManager.shared.impact(style: .medium) }
            Button("light".uppercased()) { HapticManager.shared.impact(style: .light) }
            Button("rigid".uppercased()) { HapticManager.shared.impact(style: .rigid) }
            Button("soft".uppercased()) { HapticManager.shared.impact(style: .soft) }
        }
    }
}

struct HapticBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        HapticBootcamp()
    }
}