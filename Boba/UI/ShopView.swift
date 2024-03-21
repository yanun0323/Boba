import SwiftUI

struct ShopView: View {
    @State var bubbleTeaHeroes = BubbleTeaHero.data
    var body: some View {
        VStack {
            List {
                ForEach(bubbleTeaHeroes) { hero in
                    bubbleTeaRow(hero)
                }
                .listRowBackground(Color.clear)
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .scrollIndicators(.hidden)
            
            Rectangle()
                .fill(Color.clear)
                .frame(height: 70)
        }
        .background {
            Color.orange.opacity(0.3).ignoresSafeArea()
        }
        .environment(\.defaultMinListRowHeight, 10)
        .environment(\.defaultMinListHeaderHeight, 0)
    }
    
    @MainActor
    @ViewBuilder
    private func bubbleTeaRow(_ h: BubbleTeaHero) -> some View {
        HStack {
            Image(h.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.horizontal)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(h.name)
                        .font(.title3)
                        .minimumScaleFactor(0.75)
                        .fontWeight(.bold)
                    
                    Spacer(minLength: 0)
                    
                    HStack(spacing: 2) {
                        Image(systemName: "dollarsign.circle.fill")
                        Text(h.cost.description)
                    }
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.orange)
                }
                
                HStack(spacing: 20) {
                    HStack(spacing: 2) {
                        Image(systemName: "heart.fill")
                        Text(h.health.description)
                    }
                    .foregroundStyle(.red)
                    .fontWeight(.bold)
                    
                    HStack(spacing: 2) {
                        Image(systemName: "bolt.circle.fill")
                        Text(h.power.description)
                    }
                    .foregroundStyle(.brown)
                    .fontWeight(.bold)
                }
                
                Text(h.detail)
                    .font(.footnote)
                
                Spacer(minLength: 0)
            }
            Spacer()
        }
        .padding()
        .frame(height: 150)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#if DEBUG
#Preview {
    ShopView()
}
#endif
