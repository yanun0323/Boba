import SwiftUI

struct BubbleTeaHeroView: View {
    @State var x: CGFloat
    @State var y: CGFloat
    var body: some View {
        bubbleTeaHero()
            .offset(x: x, y: y)
            .shadow(color: .black.opacity(0.2), radius: 15, y: 5)
    }
    
    @MainActor
    @ViewBuilder
    private func bubbleTeaHero() -> some View {
        Image("BubbleTeaHero")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 80)
    }
}
