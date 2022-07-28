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
//            .transition(.slide)
    }
}
extension View {
    func customText(color: Color) -> some View {
        modifier(CustomTextModifier(color: color))
    }
}

struct TransitionBootcamp: View {
    
    @State var showText1: Bool = true
    @State var showText2: Bool = true
    @State var showText3: Bool = true
    @State var showText4: Bool = true
    @State var showText5: Bool = true
    
    
    var body: some View {
        VStack {
            
            HStack {
                if showText1 {
                Text("easeIn")
                        .customText(color: .yellow)
                }
                Text("Click")
                    .onTapGesture {
                        withAnimation(.easeIn) {
                            showText1.toggle()
                        }
                    }
            }
            HStack {
                if showText2 {
                Text("easeInOut")
                        .customText(color: .green)
                }
                Text("Click")
                    .onTapGesture {
                        withAnimation(.easeInOut) {
                            showText2.toggle()
                        }
                    }
            }
            HStack {
                if showText3 {
                Text("linear")
                        .customText(color: .blue)
                }
                Text("Click")
                    .onTapGesture {
                        withAnimation(.linear) {
                            showText3.toggle()
                        }
                    }
            }
            HStack {
                if showText4 {
                Text("spring")
                        .customText(color: .pink)
                }
                Text("Click")
                    .onTapGesture {
                        withAnimation(.spring()) {
                            showText4.toggle()
                        }
                    }
            }
            HStack {
                if showText5 {
                Text("interactiveSpring")
                        .customText(color: .brown)
                }
                Text("Click")
                    .onTapGesture {
                        withAnimation(.interactiveSpring()) {
                            showText5.toggle()
                        }
                    }
            }
            
        }
    }
}

struct TransitionBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        TransitionBootcamp()
    }
}
