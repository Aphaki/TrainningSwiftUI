//
//  MagnificationGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/02/25.
//

import SwiftUI

struct MagnificationGestureBootcamp: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .padding(30)
            .font(.title)
            .background(Color.pink.cornerRadius(20))
            .foregroundColor(.white)
            .scaleEffect(1.0 + currentAmount + lastAmount)
            .gesture(
            MagnificationGesture()
                .onChanged{ (value) in
                    currentAmount = value - 1
                }
                .onEnded{ (value) in
                    withAnimation(.spring()) {
                        currentAmount = 0
                    }
                }
            )
        
    }
}

struct MagnificationGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MagnificationGestureBootcamp()
    }
}
