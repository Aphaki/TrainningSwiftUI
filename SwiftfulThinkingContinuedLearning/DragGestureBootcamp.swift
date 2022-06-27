//
//  DragGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/02/26.
//

import SwiftUI

struct DragGestureBootcamp: View {
    
    @State var offset: CGSize = .zero
    
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset.width)")
                Spacer()
            }
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 300, height: 500)
                .offset(offset)
                .scaleEffect(getScaleAmount())
                .rotationEffect(Angle(degrees: getRotationAmount()))
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()){
                                offset = value.translation
                                // translation : 드래그의 속도에 기반한 위치
                            }
                        }
                        .onEnded{ value in
                            withAnimation(.spring()){
                                offset = .zero
                            }
                        }
            )
        } // ZStack
    }
    func getScaleAmount() -> CGFloat {
        // CGFloat: Double ,Float 를 알아서 적용해주는 타입
        let max = UIScreen.main.bounds.width / 2
        //UIScreen.main.bounds: CGRect(원점 + 높이 + 너비)를 갖는 전체화면 사각형
        let currentAmount = abs(offset.width)
        let percentage = currentAmount / max
        return 1.0 - min(percentage, 0.5) * 0.5
    }
    
    func getRotationAmount() -> Double {
        let max = UIScreen.main.bounds.width / 2
        let currentAmount = offset.width
        let percentage = currentAmount / max
        let percentageAsDouble = Double(percentage)
        let maxAngle: Double = 10
        return percentageAsDouble * maxAngle
    }
}

struct DragGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp()
    }
}
