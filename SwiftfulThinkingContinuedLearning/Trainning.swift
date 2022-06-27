//
//  Trainning.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/03/07.
//

import SwiftUI

struct Trainning: View {
    @State var rating: Int = 3
    var body: some View {
        GeometryReader{ geometry in
                Rectangle()
                    .frame(width: CGFloat(rating) / 5 * geometry.size.width)
                    .foregroundColor(.yellow)
                    .allowsHitTesting(false)
        }
    }
}

struct Trainning_Previews: PreviewProvider {
    static var previews: some View {
        Trainning()
    }
}
