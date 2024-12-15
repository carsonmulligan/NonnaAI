import Foundation

struct ConversationData: Codable {
    let kitchenConversations: KitchenConversations
    
    enum CodingKeys: String, CodingKey {
        case kitchenConversations = "kitchen_conversations"
    }
}

struct KitchenConversations: Codable {
    let familyRecipes: FamilyRecipes
    
    enum CodingKeys: String, CodingKey {
        case familyRecipes = "family_recipes"
    }
}

struct FamilyRecipes: Codable {
    let ragu: Recipe
    
    enum CodingKeys: String, CodingKey {
        case ragu = "ragù"
    }
}

struct Recipe: Codable {
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
    let gesture: String?
    let culturalNote: String?
    
    enum CodingKeys: String, CodingKey {
        case reaction
        case response
        case gesture
        case culturalNote = "cultural_note"
    }
} 