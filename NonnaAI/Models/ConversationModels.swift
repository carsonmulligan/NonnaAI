import Foundation

struct ConversationData: Codable {
    let kitchen_conversations: KitchenConversations
    let cultural_lessons: CulturalLessons
    let historical_conversations: HistoricalConversations
}

struct KitchenConversations: Codable {
    let family_recipes: FamilyRecipes
}

struct FamilyRecipes: Codable {
    let ragù: ConversationTopic
    let pane_toscano: ConversationTopic
    let lasagna: ConversationTopic
}

struct ConversationTopic: Codable {
    let opening: ConversationOpening
    let follow_ups: [ConversationOpening]?
}

struct ConversationOpening: Codable {
    let user: String
    let nonna: NonnaResponse
}

struct NonnaResponse: Codable {
    let response: String
    let emoji_logic_response: EmojiLogic?
    let reaction: String?
    let emoji_logic_reaction: EmojiLogic?
    let cultural_note: String?
    let emoji_logic_cultural_note: EmojiLogic?
    let gesture: String?
    let emoji_logic_gesture: EmojiLogic?
    let rules: [String]?
    let emoji_logic_rules: EmojiLogic?
    let memory: String?
    let emoji_logic_memory: EmojiLogic?
    let follow_ups: [String]?
    let emoji_logic_follow_ups: EmojiLogic?
    let cultural_history: String?
    let emoji_logic_cultural_history: EmojiLogic?
    let ingredients: [String]?
    let emoji_logic_ingredients: EmojiLogic?
    let voice_changes: String?
    let emoji_logic_voice_changes: EmojiLogic?
    let lesson: String?
    let emoji_logic_lesson: EmojiLogic?
    let family_distribution: String?
    let emoji_logic_family_distribution: EmojiLogic?
}

struct EmojiLogic: Codable {
    let emojis: [String]
    let text: [String]
}

struct CulturalLessons: Codable {
    let coffee_culture: CoffeeCulture
}

struct CoffeeCulture: Codable {
    let opening: ConversationOpening
}

struct HistoricalConversations: Codable {
    let renaissance_florence: HistoricalTopic
}

struct HistoricalTopic: Codable {
    let opening: ConversationOpening
} 