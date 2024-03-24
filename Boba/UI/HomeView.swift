import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            Color.clear
            VStack {
                playerInfo()
                square()
            }
        }
        .background {
            bg()
        }
        .overlay {
            fg()
        }
    }
    
    @MainActor
    @ViewBuilder
    private func fg() -> some View {
        ZStack {
            VStack {
                Spacer()
                Image("HomeDesk")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .ignoresSafeArea(edges: .horizontal)
                    .offset(x: -10, y: -15)
                    .overlay {
                        Rectangle()
                            .offset(x: -10, y: -10)
                            .colorMultiply(.black.opacity(0.2))
                    }
            }
            
            VStack {
                Spacer()
                HStack {
                    Image("HomeBucketGreen")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100)
                        .overlay {
                            Image("HomeBucketGreen")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 100)
                                .colorMultiply(.black.opacity(0.2))
                        }
                        .offset(x: 50, y: -190)
                    Spacer()
                }
            }
        }
    }
    
    @MainActor
    @ViewBuilder
    private func bg() -> some View {
        ZStack {
            Image("HomeBackground")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .ignoresSafeArea()
            
            VStack {
                Image("HomePoster")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .offset(x: 130)
                Spacer()
            }
            .ignoresSafeArea(edges: .top)
            
            VStack {
                HStack {
                    Image("HomeCasher")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .offset(x: 100)
                    Spacer()
                }
                Spacer()
            }
        }
    }
    
    @MainActor
    @ViewBuilder
    private func playerInfo() -> some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Alan")
                    .kerning(2)
                HStack {
                    Image(systemName: "dollarsign")
                        .font(.title3)
                    Text("300")
                        .monospaced()
                }
            }
            .font(.title2)
            .fontWeight(.medium)
            
            Spacer()
        }
        .padding(.top, 20)
        .padding(.horizontal, 10)
    }
    
    @MainActor
    @ViewBuilder
    private func square() -> some View {
        Rectangle()
            .fill(.clear)
            .overlay {
                ZStack {
                    HStack {
                        VStack(spacing: 0) {
                            ForEach(1...4, id: \.self) { _ in
                                let x = CGFloat.random(in: 0...300)
                                let y = CGFloat.random(in: -30...50)
                                BubbleTeaHeroView(x: x, y: y)
                                    .offset(y: 130)
                            }
                            Spacer()
                        }
                        Spacer()
                    }
                }
            }
    }
}

#Preview {
    HomeView()
}
