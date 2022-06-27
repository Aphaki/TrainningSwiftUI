//
//  LongPressGestureByApple.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/02/28.
//

import SwiftUI

struct LongPressGestureByApple: View {
    @GestureState var isDetectingLongPress = false
    @State var completedLongPress = false

    var longPress: some Gesture {
            LongPressGesture(minimumDuration: 3)
                .updating($isDetectingLongPress) { currentState, gestureState,
                        transaction in
                    gestureState = currentState
                    transaction.animation = Animation.easeIn(duration: 2.0)
                }
                .onEnded { finished in
                    self.completedLongPress = finished
                }
        }

    var body: some View {
        VStack(spacing: 30) {
            Circle()
                .fill(self.isDetectingLongPress ? Color.red :
                    (self.completedLongPress ? Color.green : Color.blue))
                .frame(width: 100, height: 100, alignment: .center)
                .gesture(longPress)
            Text("Reset")
                .font(.headline)
                .fontWeight(.semibold)
                .padding()
                .background(.pink)
                .foregroundColor(.white)
                .cornerRadius(10)
                .onTapGesture {
                    completedLongPress = false
                }
            
        }
        
    }
}
struct LongPressGestureByApple_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureByApple()
    }
}
