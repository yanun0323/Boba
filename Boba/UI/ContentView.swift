import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath()
    @State private var router = ViewRouter.ShopView
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                footer()
            }
            .background {
                switch router {
                case .HomeView:
                    HomeView()
                case .ShopView:
                    ShopView()
                case .BattleView:
                    BattleView()
                }
            }
            .animation(.none, value: router)
            .ignoresSafeArea(.all, edges: .bottom)
        }
    }
    
    @MainActor
    @ViewBuilder
    private func playerName() -> some View {
        Text("Alan")
    }
    
    @MainActor
    @ViewBuilder
    private func footer() -> some View {
        HStack {
            Spacer()
            homeButton()
            Spacer()
            battleButton()
            Spacer()
            shopButton()
            Spacer()
        }
        .padding(.bottom)
        .background {
            VStack {
                Spacer()
                Rectangle()
                    .fill(.white)
                    .frame(height: 70)
            }
        }
    }
    
    @MainActor
    @ViewBuilder
    private func homeButton() -> some View {
        Button {
            router = .HomeView
        } label: {
            Image("HomeButton")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
        }
    }
    
    @MainActor
    @ViewBuilder
    private func battleButton() -> some View {
        Button {
            router = .BattleView
        } label: {
            Image("BattleButton")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150)
        }
    }
    
    @MainActor
    @ViewBuilder
    private func shopButton() -> some View {
        Button {
            router = .ShopView
        } label: {
            Image("ShopButton")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50)
        }
    }
}

#if DEBUG
#Preview {
    ContentView()
}
#endif
