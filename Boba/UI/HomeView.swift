import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.clear
            bubbleTea()
        }
        .background {
            Color.orange.opacity(0.3).ignoresSafeArea()
        }
    }
    
    @MainActor
    @ViewBuilder
    private func bubbleTea() -> some View {
        Image("BubbleTea")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 70)
    }
}

#Preview {
    HomeView()
}
