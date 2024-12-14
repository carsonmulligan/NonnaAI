import Foundation

struct ConversationData: Codable {
    let kitchenConversations: KitchenConversations
    let historicalConversations: HistoricalConversations
    let culturalLessons: CulturalLessons
    
    enum CodingKeys: String, CodingKey {
        case kitchenConversations = "kitchen_conversations"
        case historicalConversations = "historical_conversations"
        case culturalLessons = "cultural_lessons"
    }
}

struct KitchenConversations: Codable {
    let familyRecipes: FamilyRecipes
    
    enum CodingKeys: String, CodingKey {
        case familyRecipes = "family_recipes"
    }
}

struct FamilyRecipes: Codable {
    let ragu: ConversationTopic
    let paneToscano: ConversationTopic
    let lasagna: ConversationTopic
    
    enum CodingKeys: String, CodingKey {
        case ragu = "ragù"
        case paneToscano = "pane_toscano"
        case lasagna
    }
}

struct ConversationTopic: Codable {
    let opening: Opening
}

struct Opening: Codable {
    let user: String
    let emojiLogic: EmojiLogic
    let nonna: NonnaResponse
    
    enum CodingKeys: String, CodingKey {
        case user
        case emojiLogic = "emoji_logic"
        case nonna
    }
}

struct EmojiLogic: Codable {
    let emojis: [String]
    let text: [String]
}

struct NonnaResponse: Codable {
    let reaction: String?
    let response: String
    let culturalNote: String?
    let ingredients: String?
    let branching: Branching?
    
    enum CodingKeys: String, CodingKey {
        case reaction
        case response
        case culturalNote = "cultural_note"
        case ingredients
        case branching
    }
}

struct Branching: Codable {
    let aboutIngredients: AboutIngredients?
    
    enum CodingKeys: String, CodingKey {
        case aboutIngredients = "about_ingredients"
    }
}

struct AboutIngredients: Codable {
    let user: String
    let emojiLogic: EmojiLogic
    let nonna: NonnaResponse
    
    enum CodingKeys: String, CodingKey {
        case user
        case emojiLogic = "emoji_logic"
        case nonna
    }
}

struct HistoricalConversations: Codable {
    // Add historical conversation structures as needed
}

struct CulturalLessons: Codable {
    // Add cultural lesson structures as needed
} 