import SwiftUI
import AVFoundation

struct ConversationView: View {
    @StateObject private var audioService = AudioService()
    @EnvironmentObject var contentManager: ContentManager
    @State private var showingResponse = false
    @State private var showingBranching = false
    @State private var currentBranchingQuestion: String?
    @State private var showingTopicPicker = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                if let error = contentManager.error {
                    ErrorView(message: error.localizedDescription)
                } else if let conversation = contentManager.getCurrentConversation() {
                    // Topic selector
                    TopicPickerButton(
                        currentTopic: contentManager.currentTopic,
                        topics: contentManager.getAvailableTopics()
                    ) {
                        showingTopicPicker = true
                    }
                    
                    // Header with icons
                    HStack(spacing: 12) {
                        ForEach(conversation.opening.emojiLogic.emojis, id: \.self) { emoji in
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
                        } else if !showingBranching {
                            // Response (Nonna or Nonno)
                            VStack(alignment: .leading, spacing: 12) {
                                if let nonna = conversation.nonna {
                                    if let reaction = nonna.reaction {
                                        HStack {
                                            Text("👵")
                                            Text(reaction)
                                                .italic()
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                    }
                                    
                                    Text(nonna.response)
                                        .font(.system(size: 17))
                                        .foregroundColor(.white)
                                    
                                    if let culturalNote = nonna.culturalNote {
                                        HStack {
                                            Text("📝")
                                            Text(culturalNote)
                                                .italic()
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                    }
                                    
                                    if let gesture = nonna.gesture {
                                        HStack {
                                            Text("👐")
                                            Text(gesture)
                                                .italic()
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                    }
                                } else if let nonno = conversation.nonno {
                                    if let voiceChanges = nonno.voiceChanges {
                                        HStack {
                                            Text("👴")
                                            Text(voiceChanges)
                                                .italic()
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                    }
                                    
                                    Text(nonno.response)
                                        .font(.system(size: 17))
                                        .foregroundColor(.white)
                                    
                                    if let memory = nonno.memory {
                                        HStack {
                                            Text("💭")
                                            Text(memory)
                                                .italic()
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                    }
                                    
                                    if let passionateDetails = nonno.passionateDetails?.aboutMedici {
                                        VStack(alignment: .leading, spacing: 8) {
                                            Text(passionateDetails.explanation)
                                                .font(.system(size: 17))
                                                .foregroundColor(.white)
                                            Text(passionateDetails.culturalImpact)
                                                .font(.system(size: 15))
                                                .foregroundColor(.white.opacity(0.8))
                                        }
                                    }
                                }
                            }
                        }
                        
                        // Audio button
                        Button(action: {
                            if !showingResponse {
                                audioService.speak(conversation.user)
                            } else if !showingBranching {
                                if let nonna = conversation.nonna {
                                    audioService.speak(nonna.response)
                                } else if let nonno = conversation.nonno {
                                    audioService.speak(nonno.response)
                                }
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
                    
                    // Branching questions
                    if showingResponse && !showingBranching {
                        if let branching = conversation.opening.nonna.branching?.aboutIngredients {
                            Button(action: {
                                withAnimation {
                                    showingBranching = true
                                    currentBranchingQuestion = branching.user
                                }
                            }) {
                                HStack {
                                    Text(branching.user)
                                        .font(.system(size: 17))
                                        .foregroundColor(.white)
                                    Spacer()
                                    Image(systemName: "chevron.right")
                                        .foregroundColor(.white.opacity(0.8))
                                }
                                .padding()
                                .background(Color(hex: "2A3830"))
                                .cornerRadius(12)
                            }
                        }
                    }
                } else {
                    ErrorView(message: "Conversation not found")
                }
                
                Spacer()
                
                // Navigation buttons
                HStack {
                    if showingBranching {
                        Button(action: {
                            withAnimation {
                                showingBranching = false
                                currentBranchingQuestion = nil
                            }
                        }) {
                            HStack {
                                Image(systemName: "chevron.left")
                                Text("Indietro")
                            }
                            .foregroundColor(.white)
                            .padding()
                            .background(Color(hex: "C4A484"))
                            .cornerRadius(12)
                        }
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            if !showingResponse {
                                showingResponse = true
                            } else if !showingBranching {
                                // Move to next topic or reset
                                showingResponse = false
                            }
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
            }
            .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: "1E2B25"))
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("Conversazione con la Nonna")
        .sheet(isPresented: $showingTopicPicker) {
            TopicPickerView(topics: contentManager.getAvailableTopics()) { topic in
                contentManager.setTopic(topic)
                showingTopicPicker = false
            }
        }
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

struct TopicPickerButton: View {
    let currentTopic: String
    let topics: [(String, String)]
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(topics.first { $0.0 == currentTopic }?.1 ?? "")
                    .font(.system(size: 17, weight: .semibold))
                Image(systemName: "chevron.down")
            }
            .foregroundColor(.white)
            .padding()
            .background(Color(hex: "2A3830"))
            .cornerRadius(12)
        }
    }
}

struct TopicPickerView: View {
    let topics: [(String, String)]
    let onSelect: (String) -> Void
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
            List {
                ForEach(topics, id: \.0) { topic in
                    Button(action: {
                        onSelect(topic.0)
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Text(topic.1)
                            .foregroundColor(.primary)
                    }
                }
            }
            .navigationTitle("Scegli un argomento")
            .navigationBarItems(trailing: Button("Chiudi") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

class AudioService: ObservableObject {
    private let synthesizer = AVSpeechSynthesizer()
    private var currentUtterance: AVSpeechUtterance?
    
    func speak(_ text: String) {
        // Stop any current speech
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
        
        let utterance = AVSpeechUtterance(string: text)
        utterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
        utterance.rate = 0.5
        utterance.pitchMultiplier = 1.1
        utterance.volume = 1.0
        
        currentUtterance = utterance
        synthesizer.speak(utterance)
    }
    
    func stop() {
        if synthesizer.isSpeaking {
            synthesizer.stopSpeaking(at: .immediate)
        }
    }
} 