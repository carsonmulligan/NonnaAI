import SwiftUI

struct MainView: View {
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
                
                NavigationLink(destination: ConversationView()) {
                    HStack {
                        Text("Inizia a imparare")
                            .font(.system(size: 17, weight: .semibold))
                        Image(systemName: "arrow.right")
                    }
                    .foregroundColor(.white)
                    .padding()
                    .background(Color(hex: "C4A484"))
                    .cornerRadius(12)
                }
                
                VStack(spacing: 16) {
                    MenuCard(title: "Ricette di Famiglia", subtitle: "Scopri i segreti della cucina italiana", icon: "👵")
                    MenuCard(title: "Storia e Cultura", subtitle: "Esplora il ricco passato dell'Italia", icon: "🏛️")
                    MenuCard(title: "Lingua Viva", subtitle: "Impara l'italiano autentico", icon: "🗣️")
                }
                .padding(.horizontal)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(hex: "1E2B25"))
        }
    }
}

struct MenuCard: View {
    let title: String
    let subtitle: String
    let icon: String
    
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
    }
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3:
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6:
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
} 