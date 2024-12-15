import Foundation
import Combine

class ContentManager: ObservableObject {
    @Published var conversationData: ConversationData?
    @Published var error: Error?
    @Published var currentCategory: ConversationCategory = .kitchen
    @Published var currentTopic: String = "ragù"
    
    enum ConversationCategory {
        case kitchen, historical, cultural
    }
    
    init() {
        loadContent()
    }
    
    private func loadContent() {
        guard let url = Bundle.main.url(forResource: "questions", withExtension: "json") else {
            error = ContentError.fileNotFound
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            conversationData = try decoder.decode(ConversationData.self, from: data)
        } catch {
            self.error = error
            print("Error decoding JSON: \(error)")
        }
    }
    
    func getCurrentConversation() -> Opening? {
        guard let data = conversationData else { return nil }
        
        switch currentCategory {
        case .kitchen:
            return data.kitchenConversations.familyRecipes.ragu.opening
        case .historical, .cultural:
            return nil // We'll add these later
        }
    }
    
    func getAvailableTopics() -> [(String, String)] {
        switch currentCategory {
        case .kitchen:
            return [("ragù", "Ragù alla Fiorentina")]
        case .historical:
            return []
        case .cultural:
            return []
        }
    }
    
    func setTopic(_ topic: String) {
        currentTopic = topic
    }
}

enum ContentError: Error {
    case fileNotFound
    case conversationNotFound
    
    var localizedDescription: String {
        switch self {
        case .fileNotFound:
            return "Could not find questions.json in the app bundle"
        case .conversationNotFound:
            return "Could not find the requested conversation"
        }
    }
} 