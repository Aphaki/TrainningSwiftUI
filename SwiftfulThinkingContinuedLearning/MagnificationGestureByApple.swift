//
//  MagnificationGestureByApple.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/03/01.
//

import SwiftUI

struct MagnificationGestureByApple: View {

    @GestureState var magnifyBy = 1.0

    var magnification: some Gesture {
        MagnificationGesture()
            .updating($magnifyBy) { currentState, gestureState, transaction in
                gestureState = currentState
            }
    }

    var body: some View {
        Circle()
            .frame(width: 100, height: 100)
            .scaleEffect(magnifyBy)
            .gesture(magnification)
    }
}

struct MagnificationGestureByApple_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureByApple()
    }
}
