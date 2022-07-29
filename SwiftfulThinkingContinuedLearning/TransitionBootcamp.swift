//
//  TransitionBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/07/28.
//

import SwiftUI

struct CustomTextModifier: ViewModifier {
    
    let backgroundColor: Color
    
    init(color: Color = .yellow) {
        backgroundColor = color
    }
    
    func body(content: Content) -> some View {
        content
            .font(.headline)
            .frame(width: 200, height: 50, alignment: .center)
            .background(backgroundColor)
            .foregroundColor(.white)
            .cornerRadius(20)
            .transition(.offset(x: UIScreen.main.bounds.width,
                                y: UIScreen.main.bounds.height))
//            .transition(.scale(scale: 0))
//            .transition(.slide)
    }
}
//MARK: - Main View
struct TransitionBootcamp: View {
    
    @State var showText: Bool = true
    
    var body: some View {
        VStack {
            Spacer()
            if showText {
            Text("Transition Text!")
                .customText(color: .green)
            }
            Spacer()
            Text("click")
                .onTapGesture {
//                    withAnimation(.easeIn) {
                        showText.toggle()
//                    }
                }
        }
    }
}

struct TransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootcamp()
    }
}
