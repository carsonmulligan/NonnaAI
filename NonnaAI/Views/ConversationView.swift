import SwiftUI

struct ConversationView: View {
    @StateObject private var audioService = AudioService()
    @EnvironmentObject var contentManager: ContentManager
    @State private var showingResponse = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let error = contentManager.error {
                    ErrorView(message: error.localizedDescription)
                } else if let conversation = contentManager.getCurrentConversation() {
                    // Header with icons
                    HStack(spacing: 12) {
                        ForEach(conversation.emojiLogic.emojis, id: \.self) { emoji in
                            Text(emoji)
                                .font(.system(size: 24))
                        }
                    }
                    .padding()
                    .background(Color(hex: "2A3830"))
                    .cornerRadius(12)
                    
                    // Conversation card
                    VStack(alignment: .leading, spacing: 16) {
                        if !showingResponse {
                            // User question
                            Text(conversation.user)
                                .font(.system(size: 17))
                                .foregroundColor(.white)
                        } else {
                            // Nonna's response
                            VStack(alignment: .leading, spacing: 12) {
                                if let reaction = conversation.nonna.reaction {
                                    HStack {
                                        Text("👵")
                                        Text(reaction)
                                            .italic()
                                            .foregroundColor(.white.opacity(0.8))
                                    }
                                }
                                
                                Text(conversation.nonna.response)
                                    .font(.system(size: 17))
                                    .foregroundColor(.white)
                                
                                if let gesture = conversation.nonna.gesture {
                                    HStack {
                                        Text("👐")
                                        Text(gesture)
                                            .italic()
                                            .foregroundColor(.white.opacity(0.8))
                                    }
                                }
                                
                                if let culturalNote = conversation.nonna.culturalNote {
                                    HStack {
                                        Text("📝")
                                        Text(culturalNote)
                                            .italic()
                                            .foregroundColor(.white.opacity(0.8))
                                    }
                                }
                            }
                        }
                        
                        // Audio button
                        Button(action: {
                            if !showingResponse {
                                audioService.speak(conversation.user)
                            } else {
                                audioService.speak(conversation.nonna.response)
                            }
                        }) {
                            Image(systemName: "speaker.wave.2.fill")
                                .font(.system(size: 24))
                                .foregroundColor(.white)
                                .frame(width: 44, height: 44)
                                .background(Color(hex: "C4A484"))
                                .cornerRadius(22)
                        }
                        .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                    .padding()
                    .background(Color(hex: "2A3830"))
                    .cornerRadius(12)
                } else {
                    ErrorView(message: "Conversation not found")
                }
                
                Spacer()
                
                // Next button
                Button(action: {
                    withAnimation {
                        showingResponse.toggle()
                    }
                }) {
                    HStack {
                        Text(showingResponse ? "Prossima" : "Avanti")
                            .font(.system(size: 17, weight: .semibold))
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 120)
                    .background(Color(hex: "C4A484"))
                    .cornerRadius(12)
                }
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "1E2B25"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Conversazione con la Nonna")
    }
}

struct ErrorView: View {
    let message: String
    
    var body: some View {
        VStack {
            Image(systemName: "exclamationmark.triangle")
                .font(.system(size: 40))
                .foregroundColor(.white.opacity(0.8))
            Text(message)
                .font(.system(size: 17))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .padding()
        .background(Color(hex: "2A3830"))
        .cornerRadius(12)
    }
} 