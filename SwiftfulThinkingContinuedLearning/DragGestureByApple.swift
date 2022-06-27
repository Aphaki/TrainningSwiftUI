//
//  DragGestureByApple.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/03/02.
//

import SwiftUI

struct DragGestureByApple: View {
    @State var isDragging = false
    @State var offset: CGSize = .zero

    var drag: some Gesture {
        DragGesture()
            .onChanged { value in
                self.isDragging = true
                offset = value.translation
                
            }
            .onEnded { value in
                self.isDragging = false
                withAnimation(.spring()){
                    offset = .zero
                }
            }
    }

    var body: some View {
        Circle()
            .fill(self.isDragging ? Color.red : Color.blue)
            .frame(width: 100, height: 100, alignment: .center)
            .offset(offset)
            .gesture(drag)
    }
}

struct DragGestureByApple_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureByApple()
    }
}
