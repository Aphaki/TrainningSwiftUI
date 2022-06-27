//
//  SheetByApple.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/03/05.
//

import SwiftUI

struct SheetByApple: View {
    @State var cardDetatils: Card?
    
    var body: some View {
        Button("Show Part Details"){
           //button action
            cardDetatils = Card(id: "1", partNumner: "Z-1234A", name: "Widjet", quantityOnHand: 100)
        }
        .sheet(item: $cardDetatils, onDismiss: nil) { details in
            VStack{
                Text("id: \(details.id)")
                Text("partNumber: \(details.partNumner)")
                Text("name: \(details.name)")
                Text("Quantity on-hand: \(details.quantityOnHand)")
            }
        }
    }
}

struct Card: Identifiable {
    var id: String
    let partNumner: String
    let name: String
    let quantityOnHand: Int
}

struct SheetByApple_Previews: PreviewProvider {
    static var previews: some View {
        SheetByApple()
    }
}
