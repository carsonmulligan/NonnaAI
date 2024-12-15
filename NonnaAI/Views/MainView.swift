import SwiftUI

struct MainView: View {
    @StateObject private var contentManager = ContentManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Impara l'italiano con la Nonna")
                    .font(.system(size: 34, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Text("Scopri la cultura, la cucina e la storia d'Italia attraverso conversazioni autentiche con la nonna.")
                    .font(.system(size: 17))
                    .foregroundColor(.white.opacity(0.8))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                VStack(spacing: 16) {
                    MenuCard(
                        title: "Ricette di Famiglia",
                        subtitle: "Scopri i segreti della cucina italiana",
                        icon: "👵",
                        action: {
                            contentManager.currentCategory = .kitchen
                            contentManager.setTopic("ragù")
                        }
                    )
                    
                    MenuCard(
                        title: "Storia e Cultura",
                        subtitle: "Esplora il ricco passato dell'Italia",
                        icon: "🏛️",
                        action: {
                            contentManager.currentCategory = .historical
                            contentManager.setTopic("renaissance_florence")
                        }
                    )
                    
                    MenuCard(
                        title: "Lingua Viva",
                        subtitle: "Impara l'italiano autentico",
                        icon: "🗣️",
                        action: {
                            contentManager.currentCategory = .cultural
                            contentManager.setTopic("coffee_culture")
                        }
                    )
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "1E2B25"))
        }
        .environmentObject(contentManager)
    }
}

struct MenuCard: View {
    let title: String
    let subtitle: String
    let icon: String
    let action: () -> Void
    
    var body: some View {
        NavigationLink(destination: ConversationView()) {
            HStack {
                Text(icon)
                    .font(.system(size: 24))
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                    Text(subtitle)
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color(hex: "2A3830"))
            .cornerRadius(12)
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(TapGesture().onEnded {
            action()
        })
    }
} 