import SwiftUI

struct BattleView: View {
    var body: some View {
        Color.pink.opacity(0.3).ignoresSafeArea()
    }
}

#if DEBUG
#Preview {
    BattleView()
}
#endif
