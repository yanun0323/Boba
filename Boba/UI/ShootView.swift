import SwiftUI

struct ShootView: View {
    @Binding var shoot: Bool
    @State var far: CGFloat
    @State var d: TimeInterval
    var body: some View {
        Image("Bubble")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 30)
            .offset(x: shoot ? far : 0)
            .animation(.linear(duration: d), value: shoot)
    }
}

#if DEBUG
#Preview {
    ShootView(shoot: .constant(true), far: 150, d: 0.2)
}
#endif
