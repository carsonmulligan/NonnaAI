import SwiftUI
import AVFoundation

struct ConversationView: View {
    @StateObject private var audioService = AudioService()
    @State private var currentQuestion = 0
    @State private var showingResponse = false
    
    var body: some View {
        VStack(spacing: 20) {
            // Header with icons
            HStack(spacing: 12) {
                ForEach(["👨‍👩‍👧‍👦", "🍲", "👵", "📖", "🇮🇹", "🕒", "❓"], id: \.self) { emoji in
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
                    Text("Nonna, ogni famiglia ha la sua ricetta del ragù?")
                        .font(.system(size: 17))
                        .foregroundColor(.white)
                } else {
                    VStack(alignment: .leading, spacing: 12) {
                        HStack {
                            Text("👵")
                            Text("ride dolcemente")
                                .italic()
                                .foregroundColor(.white.opacity(0.8))
                        }
                        
                        Text("Ogni famiglia, ogni nonna, ogni città! Il nostro è alla fiorentina")
                            .font(.system(size: 17))
                            .foregroundColor(.white)
                        
                        HStack {
                            Text("📔")
                            Text("apre il vecchio quaderno di ricette")
                                .italic()
                                .foregroundColor(.white.opacity(0.8))
                        }
                    }
                }
                
                // Audio button
                Button(action: {
                    if !showingResponse {
                        audioService.speak("Nonna, ogni famiglia ha la sua ricetta del ragù?")
                    } else {
                        audioService.speak("Ogni famiglia, ogni nonna, ogni città! Il nostro è alla fiorentina")
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
            
            Spacer()
            
            // Next button
            Button(action: {
                withAnimation {
                    showingResponse.toggle()
                }
            }) {
                HStack {
                    Text("Avanti")
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
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "1E2B25"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Conversazione con la Nonna")
    }
}

class AudioService: ObservableObject {
    private let synthesizer = AVSpeechSynthesizer()
    
    func speak(_ text: String) {
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.1
        synthesizer.speak(utterance)
    }
} 