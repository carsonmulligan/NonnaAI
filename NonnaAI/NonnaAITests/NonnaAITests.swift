//
//  NonnaAITests.swift
//  NonnaAITests
//
//  Created by Carson Mulligan on 12/14/24.
//

import XCTest
@testable import NonnaAI

final class NonnaAITests: XCTestCase {
    var testBundle: Bundle!
    
    override func setUpWithError() throws {
        testBundle = Bundle(for: type(of: self))
    }
    
    func testJSONParsing() throws {
        // Test JSON loading and parsing
        guard let jsonURL = Bundle.main.url(forResource: "questions", withExtension: "json"),
              let jsonData = try? Data(contentsOf: jsonURL) else {
            XCTFail("Failed to load questions.json")
            return
        }
        
        do {
            let decoder = JSONDecoder()
            let conversations = try decoder.decode(ConversationData.self, from: jsonData)
            
            // Test kitchen conversations
            XCTAssertNotNil(conversations.kitchen_conversations.family_recipes.ragù.opening)
            XCTAssertEqual(
                conversations.kitchen_conversations.family_recipes.ragù.opening.user,
                "Nonna, ogni famiglia ha la sua ricetta del ragù?"
            )
            
            // Test cultural lessons
            XCTAssertNotNil(conversations.cultural_lessons.coffee_culture.opening)
            XCTAssertEqual(
                conversations.cultural_lessons.coffee_culture.opening.user,
                "Come si ordina un caffè come un vero italiano?"
            )
            
            // Test historical conversations
            XCTAssertNotNil(conversations.historical_conversations.renaissance_florence.opening)
        } catch {
            XCTFail("Failed to parse JSON: \(error)")
        }
    }
    
    func testEmojiLogic() throws {
        // Test emoji logic structure
        let emojiLogic = EmojiLogic(
            emojis: ["👨‍👩‍👧‍👦", "🍲"],
            text: ["Famiglia", "Piatto"]
        )
        
        XCTAssertEqual(emojiLogic.emojis.count, 2)
        XCTAssertEqual(emojiLogic.text.count, 2)
        XCTAssertEqual(emojiLogic.emojis[0], "👨‍👩‍👧‍👦")
        XCTAssertEqual(emojiLogic.text[0], "Famiglia")
    }
    
    func testNonnaResponse() throws {
        // Test nonna response structure
        let emojiLogic = EmojiLogic(emojis: ["😊"], text: ["Sorriso"])
        let nonnaResponse = NonnaResponse(
            response: "Test response",
            emoji_logic_response: emojiLogic,
            reaction: "Test reaction",
            emoji_logic_reaction: nil,
            cultural_note: nil,
            emoji_logic_cultural_note: nil,
            gesture: nil,
            emoji_logic_gesture: nil,
            rules: nil,
            emoji_logic_rules: nil,
            memory: nil,
            emoji_logic_memory: nil,
            follow_ups: nil,
            emoji_logic_follow_ups: nil,
            cultural_history: nil,
            emoji_logic_cultural_history: nil,
            ingredients: nil,
            emoji_logic_ingredients: nil,
            voice_changes: nil,
            emoji_logic_voice_changes: nil,
            lesson: nil,
            emoji_logic_lesson: nil,
            family_distribution: nil,
            emoji_logic_family_distribution: nil
        )
        
        XCTAssertEqual(nonnaResponse.response, "Test response")
        XCTAssertEqual(nonnaResponse.reaction, "Test reaction")
        XCTAssertNotNil(nonnaResponse.emoji_logic_response)
    }
}
