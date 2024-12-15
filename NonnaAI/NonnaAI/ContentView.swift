//
//  ContentView.swift
//  NonnaAI
//
//  Created by Carson Mulligan on 12/14/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            VStack(spacing: 30) {
                Text("Impara l'italiano con la Nonna")
                    .font(.system(size: 34, weight: .bold))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                NavigationLink(destination: ConversationView()) {
                    Text("Inizia a imparare")
                        .font(.system(size: 17, weight: .semibold))
                        .padding()
                        .frame(minWidth: 200)
                        .background(Color(hex: "C4A484"))
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
                
                VStack(spacing: 20) {
                    NavigationLink(destination: ConversationView()) {
                        CategoryButton(title: "Ricette di Famiglia", subtitle: "Scopri i segreti della cucina italiana")
                    }
                    
                    NavigationLink(destination: ConversationView()) {
                        CategoryButton(title: "Storia e Cultura", subtitle: "Esplora il ricco passato dell'Italia")
                    }
                    
                    NavigationLink(destination: ConversationView()) {
                        CategoryButton(title: "Lingua Viva", subtitle: "Impara l'italiano autentico")
                    }
                }
                .padding(.horizontal)
                
                Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "1E2B25"))
            .foregroundColor(.white)
        }
    }
}

struct CategoryButton: View {
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(title)
                .font(.system(size: 20, weight: .semibold))
            Text(subtitle)
                .font(.system(size: 14))
                .opacity(0.8)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(hex: "2A3830"))
        .cornerRadius(10)
    }
}

#Preview {
    ContentView()
}
