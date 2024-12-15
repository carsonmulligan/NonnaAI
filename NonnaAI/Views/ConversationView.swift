import SwiftUI

struct ConversationView: View {
    @State private var currentQuestion: String = "Nonna, ogni famiglia ha la sua ricetta del ragù?"
    @State private var showingResponse: Bool = false
    @State private var nonnaResponse: String = "Ogni famiglia, ogni nonna, ogni città! Il nostro è alla fiorentina 🍖"
    
    var body: some View {
        VStack {
            if !showingResponse {
                Text(currentQuestion)
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
            } else {
                Text(nonnaResponse)
                    .font(.title2)
                    .padding()
                    .multilineTextAlignment(.center)
            }
            
            Button(action: {
                withAnimation {
                    showingResponse.toggle()
                }
            }) {
                Text("Avanti")
                    .font(.headline)
                    .padding()
                    .background(Color(hex: "C4A484"))
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "1E2B25"))
        .foregroundColor(.white)
    }
} 