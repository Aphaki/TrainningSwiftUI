//
//  RotationGestureByApple.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/03/02.
//

import SwiftUI

struct RotationGestureByApple: View {
    @State var angle = Angle(degrees: 0.0)

    var rotation: some Gesture {
        RotationGesture()
            .onChanged { angle in
                self.angle = angle
            }
    }

    var body: some View {
        Rectangle()
            .frame(width: 200, height: 200, alignment: .center)
            .rotationEffect(self.angle)
            .gesture(rotation)
    }
}

struct RotationGestureByApple_Previews: PreviewProvider {
    static var previews: some View {
        RotationGestureByApple()
    }
}
