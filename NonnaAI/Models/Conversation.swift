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

struct HistoricalConversations: Codable {
    let renaissanceFlorence: RenaissanceFlorence
    let worldWars: WorldWars
    
    enum CodingKeys: String, CodingKey {
        case renaissanceFlorence = "renaissance_florence"
        case worldWars = "world_wars"
    }
}

struct CulturalLessons: Codable {
    let coffeeCulture: CoffeeCulture
    let marketShopping: MarketShopping
    let familyGeography: FamilyGeography
    
    enum CodingKeys: String, CodingKey {
        case coffeeCulture = "coffee_culture"
        case marketShopping = "market_shopping"
        case familyGeography = "family_geography"
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

struct RenaissanceFlorence: Codable {
    let opening: HistoricalOpening
}

struct WorldWars: Codable {
    let resistance: ResistanceConversation
}

struct CoffeeCulture: Codable {
    let opening: CulturalOpening
}

struct MarketShopping: Codable {
    let atMarket: MarketConversation
    
    enum CodingKeys: String, CodingKey {
        case atMarket = "at_market"
    }
}

struct FamilyGeography: Codable {
    let opening: CulturalOpening
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

struct HistoricalOpening: Codable {
    let user: String
    let emojiLogic: EmojiLogic
    let nonno: NonnoResponse
    
    enum CodingKeys: String, CodingKey {
        case user
        case emojiLogic = "emoji_logic"
        case nonno
    }
}

struct CulturalOpening: Codable {
    let user: String
    let emojiLogic: EmojiLogic
    let nonna: NonnaResponse
    
    enum CodingKeys: String, CodingKey {
        case user
        case emojiLogic = "emoji_logic"
        case nonna
    }
}

struct ResistanceConversation: Codable {
    let user: String
    let emojiLogic: EmojiLogic
    let nonno: NonnoResponse
    
    enum CodingKeys: String, CodingKey {
        case user
        case emojiLogic = "emoji_logic"
        case nonno
    }
}

struct MarketConversation: Codable {
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
    let gesture: String?
    
    enum CodingKeys: String, CodingKey {
        case reaction
        case response
        case culturalNote = "cultural_note"
        case ingredients
        case branching
        case gesture
    }
}

struct NonnoResponse: Codable {
    let voiceChanges: String?
    let response: String
    let memory: String?
    let passionateDetails: PassionateDetails?
    let branching: Branching?
    
    enum CodingKeys: String, CodingKey {
        case voiceChanges = "voice_changes"
        case response
        case memory
        case passionateDetails = "passionate_details"
        case branching
    }
}

struct PassionateDetails: Codable {
    let aboutMedici: AboutMedici?
    
    enum CodingKeys: String, CodingKey {
        case aboutMedici = "about_medici"
    }
}

struct AboutMedici: Codable {
    let explanation: String
    let culturalImpact: String
    
    enum CodingKeys: String, CodingKey {
        case explanation
        case culturalImpact = "cultural_impact"
    }
}

struct Branching: Codable {
    let aboutIngredients: AboutIngredients?
    let aboutResistance: AboutResistance?
    
    enum CodingKeys: String, CodingKey {
        case aboutIngredients = "about_ingredients"
        case aboutResistance = "about_resistance"
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

struct AboutResistance: Codable {
    let questions: [String]
    let emojiLogicQuestions: [String: ResistanceEmojiLogic]
    
    enum CodingKeys: String, CodingKey {
        case questions
        case emojiLogicQuestions = "emoji_logic_questions"
    }
}

struct ResistanceEmojiLogic: Codable {
    let emojis: [String]
    let text: [String]
} 