import Foundation

struct ConversationData: Codable {
    let kitchen_conversations: KitchenConversations
    let historical_conversations: HistoricalConversations
    let cultural_lessons: CulturalLessons
}

struct KitchenConversations: Codable {
    let family_recipes: FamilyRecipes
}

struct FamilyRecipes: Codable {
    let ragù: RecipeConversation
    let pane_toscano: RecipeConversation
    let lasagna: RecipeConversation
}

struct RecipeConversation: Codable {
    let opening: ConversationOpening
}

struct ConversationOpening: Codable {
    let user: String
    let emoji_logic: EmojiLogic
    let nonna: NonnaResponse?
    let nonno: NonnaResponse?
}

struct HistoricalConversations: Codable {
    let renaissance_florence: HistoricalTopic
    let world_wars: WorldWars
}

struct WorldWars: Codable {
    let resistance: ConversationOpening
}

struct HistoricalTopic: Codable {
    let opening: ConversationOpening
}

struct CulturalLessons: Codable {
    let coffee_culture: CoffeeCulture
    let market_shopping: MarketShopping
    let family_geography: FamilyGeography
}

struct CoffeeCulture: Codable {
    let opening: ConversationOpening
}

struct MarketShopping: Codable {
    let at_market: ConversationOpening
}

struct FamilyGeography: Codable {
    let opening: ConversationOpening
}

struct EmojiLogic: Codable {
    let emojis: [String]
    let text: [String]
}

struct NonnaResponse: Codable {
    let response: String?
    let emoji_logic_response: EmojiLogic?
    let reaction: String?
    let emoji_logic_reaction: EmojiLogic?
    let cultural_note: String?
    let emoji_logic_cultural_note: EmojiLogic?
    let gesture: String?
    let emoji_logic_gesture: EmojiLogic?
    let rules: [String]?
    let emoji_logic_rules: [String: EmojiLogic]?
    let memory: String?
    let emoji_logic_memory: EmojiLogic?
    let follow_ups: [String]?
    let emoji_logic_follow_ups: [String: EmojiLogic]?
    let cultural_history: String?
    let emoji_logic_cultural_history: EmojiLogic?
    let ingredients: String?
    let emoji_logic_ingredients: EmojiLogic?
    let voice_changes: String?
    let emoji_logic_voice_changes: EmojiLogic?
    let lesson: String?
    let emoji_logic_lesson: EmojiLogic?
    let family_distribution: String?
    let emoji_logic_family_distribution: EmojiLogic?
} 