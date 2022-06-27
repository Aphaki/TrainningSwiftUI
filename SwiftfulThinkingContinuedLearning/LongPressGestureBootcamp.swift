//
//  LongPressGestureBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/02/24.
//

import SwiftUI

struct LongPressGestureBootcamp: View {
    @State var isComplete = false
    @State var isSuccess = false
    
    var body: some View {
        GeometryReader { proxy in
            VStack(spacing: 40) {
                Spacer()
                Rectangle()
                    .fill(isSuccess ? .green : .blue)
                    .frame(width: isComplete ? proxy.size.width : 0)
                    .frame(height: 70)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .background(.secondary)
                
                HStack(spacing: 40) {
                    Text("Click")
                        .font(.title)
                        .padding()
                        .background(.pink)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .onLongPressGesture(minimumDuration: 1.0, maximumDistance: 10) { (isPressing) in
                            if isPressing {
                                withAnimation(.easeInOut(duration: 1.0)){
                                    isComplete = true
                                }
                            }
                            else {
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
                                    if !isSuccess {
                                        withAnimation(.easeInOut){
                                            isComplete = false
                                        }
                                    }
                                }
                                
                            }
                        }
                perform: {
                    withAnimation(.easeInOut) {
                        isSuccess = true
                    }
                    
                }
                    Text("Reset")
                        .font(.title)
                        .padding()
                        .background(.brown)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .onTapGesture {
                            isSuccess = false
                            isComplete = false
                        }
                }
                
                Spacer()
            }
            
        }
    }
    
}

struct LongPressGestureBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        LongPressGestureBootcamp()
    }
}
