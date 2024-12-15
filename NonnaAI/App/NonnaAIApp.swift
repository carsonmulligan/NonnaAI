import SwiftUI

@main
struct NonnaAIApp: App {
    @StateObject private var contentManager = ContentManager()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(contentManager)
        }
    }
} 