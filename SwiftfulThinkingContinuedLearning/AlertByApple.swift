//
//  AlertByApple.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Sy Lee on 2022/07/08.
//

import SwiftUI

struct SaveDetails: Identifiable {
    let id = UUID()
    let name: String
    let error: String
}
class ViewModel: ObservableObject {
    
    var isOnError: Bool = false
    
    func save(didError: Binding<Bool>) -> SaveDetails? {
        isOnError = didError.wrappedValue
        if isOnError {
            print("에러 발생")
            return nil
        } else {
            return SaveDetails(name: "example", error: "example error")
        }
    }
}

struct AlertByApple: View {
    var title: String = "Alert Title"
    @StateObject var model = ViewModel()
    @State var didError = false
    @State var details: SaveDetails?
    var body: some View {
        Button("Save File") {
            details = model.save(didError: $didError)
            didError = true
        }
        .alert(
            title, isPresented: $didError, presenting: details
        ) { detail in
            Button(role: .destructive) {
                // Handle delete action.
            } label: {
                Text("""
                Delete \(detail.name)
                """)
            }
            Button("Retry") {
                // handle retry action.
            }
        } message: { detail in
            Text(detail.error)
        }
    }
}

struct AlertByApple_Previews: PreviewProvider {
    static var previews: some View {
        AlertByApple()
    }
}
