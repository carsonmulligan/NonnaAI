import SwiftUI

struct MainView: View {
    @EnvironmentObject var contentManager: ContentManager
    
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
                    CategoryCard(
                        title: "Ricette di Famiglia",
                        subtitle: "Scopri i segreti della cucina italiana",
                        icon: "👵",
                        category: .kitchen
                    )
                    
                    CategoryCard(
                        title: "Storia e Cultura",
                        subtitle: "Esplora il ricco passato dell'Italia",
                        icon: "🏛️",
                        category: .historical
                    )
                    
                    CategoryCard(
                        title: "Lingua Viva",
                        subtitle: "Impara l'italiano autentico",
                        icon: "🗣️",
                        category: .cultural
                    )
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "1E2B25"))
            .navigationBarHidden(true)
        }
    }
}

struct CategoryCard: View {
    @EnvironmentObject var contentManager: ContentManager
    let title: String
    let subtitle: String
    let icon: String
    let category: ContentManager.ConversationCategory
    
    var body: some View {
        NavigationLink(destination: ConversationView()) {
            HStack {
                Text(icon)
                    .font(.system(size: 24))
                
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.system(size: 17, weight: .semibold))
                        .foregroundColor(.white)
                    Text(subtitle)
                        .font(.system(size: 15))
                        .foregroundColor(.white.opacity(0.8))
                }
                
                Spacer()
                
                Image(systemName: "chevron.right")
                    .foregroundColor(.white.opacity(0.6))
            }
            .padding()
            .background(Color(hex: "2A3830"))
            .cornerRadius(12)
        }
        .simultaneousGesture(TapGesture().onEnded {
            contentManager.currentCategory = category
            contentManager.setTopic(contentManager.getAvailableTopics().first?.0 ?? "")
        })
    }
} 