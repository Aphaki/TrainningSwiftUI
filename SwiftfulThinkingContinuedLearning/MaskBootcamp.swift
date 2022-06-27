//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/03/07.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 0
    
    var body: some View {
     
        starView
            .overlay(rectangleView.mask(starView))
  
    }
    private var rectangleView: some View {
        ZStack{
            GeometryReader{ geometry in
                    Rectangle()
                        .frame(width: CGFloat(rating) / 5 * geometry.size.width)
                        .foregroundColor(.yellow)
                        
            }
        }.allowsHitTesting(false)
        
    }
    private var starView: some View {
        HStack{
            ForEach(1..<6){ index in
                Image(systemName: "star.fill")
                    .font(.largeTitle)
                    .foregroundColor(.gray)
                    .onTapGesture {
                        rating = index
                    }
            }
        }
    }
}
struct MaskBootcamp_Previews: PreviewProvider {
    static var previews: some View {
        MaskBootcamp()
    }
}
