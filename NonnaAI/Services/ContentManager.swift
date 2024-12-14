import Foundation

class ContentManager: ObservableObject {
    @Published var conversationData: ConversationData?
    @Published var error: Error?
    
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
        }
    }
}

enum ContentError: Error {
    case fileNotFound
    
    var localizedDescription: String {
        switch self {
        case .fileNotFound:
            return "Could not find questions.json in the app bundle"
        }
    }
} 