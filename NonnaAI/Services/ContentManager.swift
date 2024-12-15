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
            switch currentTopic {
            case "ragù":
                return data.kitchenConversations.familyRecipes.ragu.opening
            case "pane_toscano":
                return data.kitchenConversations.familyRecipes.paneToscano.opening
            case "lasagna":
                return data.kitchenConversations.familyRecipes.lasagna.opening
            default:
                return nil
            }
            
        case .historical:
            switch currentTopic {
            case "renaissance_florence":
                return data.historicalConversations.renaissanceFlorence.opening
            case "world_wars":
                return data.historicalConversations.worldWars.resistance
            default:
                return nil
            }
            
        case .cultural:
            switch currentTopic {
            case "coffee_culture":
                return data.culturalLessons.coffeeCulture.opening
            case "market_shopping":
                return data.culturalLessons.marketShopping.atMarket
            case "family_geography":
                return data.culturalLessons.familyGeography.opening
            default:
                return nil
            }
        }
    }
    
    func getAvailableTopics() -> [(String, String)] {
        switch currentCategory {
        case .kitchen:
            return [
                ("ragù", "Ragù alla Fiorentina"),
                ("pane_toscano", "Pane Toscano"),
                ("lasagna", "Lasagna Tradizionale")
            ]
        case .historical:
            return [
                ("renaissance_florence", "Firenze Rinascimentale"),
                ("world_wars", "La Resistenza")
            ]
        case .cultural:
            return [
                ("coffee_culture", "Il Caffè Italiano"),
                ("market_shopping", "Al Mercato"),
                ("family_geography", "La Famiglia in Italia")
            ]
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