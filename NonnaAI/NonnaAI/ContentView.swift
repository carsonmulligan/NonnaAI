//
//  ContentView.swift
//  NonnaAI
//
//  Created by Carson Mulligan on 12/14/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Impara l'italiano con la Nonna")
                    .font(.largeTitle)
                    .padding()
                
                NavigationLink(destination: ConversationView()) {
                    Text("Inizia a imparare")
                        .font(.headline)
                        .padding()
                        .background(Color(hex: "#C4A484"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .background(Color(hex: "#1E2B25"))
            .foregroundColor(.white)
        }
    }
}

#Preview {
    ContentView()
}
