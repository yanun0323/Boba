import SwiftUI

struct ShopView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 5) {
                Text("Shop")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                List {
                    ForEach(BubbleTeaCardCategory.allCases) { c in
                        NavigationLink {
                            bubbleTeaDetail(c.value)
                        } label: {
                            bubbleTeaRow(c.value)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(.hidden)
                }
                .listStyle(.plain)
                .scrollIndicators(.hidden)
                Rectangle()
                    .fill(.clear)
                    .frame(height: 90)
            }
        }
        .navigationTitle("Shop")
        .toolbar(.hidden, for: .navigationBar)
        .navigationBarTitleDisplayMode(.large)
        .background {
            Color.black.opacity(0.85).ignoresSafeArea()
        }
        .environment(\.defaultMinListRowHeight, 10)
        .environment(\.defaultMinListHeaderHeight, 0)
        .onAppear {
            UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
            UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]


        }
    }
    
    @MainActor
    @ViewBuilder
    private func image(_ h: BubbleTeaCard) -> some View {
        Image(h.image)
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black.opacity(0.2), radius: 15, y: 5)
            .overlay {
                Image(h.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .colorMultiply(h.mutiColor.opacity(0.5))
            }
    }
    
    @MainActor
    @ViewBuilder
    private func bubbleTeaDetail(_ h: BubbleTeaCard) -> some View {
        VStack {
            ScrollView {
                VStack(spacing: 20) {
                    ZStack {
                        Color.white
                        HStack {
                            Spacer()
                            image(h)
                            Spacer()
                        }
                        .frame(width: 200)
                        .padding()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    HStack {
                        VStack(alignment: .leading, spacing: 20) {
                            Text(h.name)
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                            
                            HStack(spacing: 20) {
                                HStack(spacing: 5) {
                                    Image(systemName: "heart.fill")
                                    Text(h.health.description)
                                }
                                .foregroundStyle(.red)
                                
                                HStack(spacing: 5) {
                                    Image(systemName: "bolt.circle.fill")
                                    Text(h.power.description)
                                }
                                .foregroundStyle(.brown)
                            }
                            .font(.title3)
                            .fontWeight(.bold)
                            
                            Text(h.detail)
                                .foregroundStyle(.white)
                                .lineSpacing(5)
                        }
                        
                        Spacer()
                    }
                }
            }
            .padding(.horizontal)
            
            HStack {
                Button {
                    print("Buy \(h.name)")
                } label: {
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.orange)
                        .frame(height: 50)
                        .shadow(color: .black.opacity(0.2), radius: 1.5, y: 5)
                        .overlay {
                            Text("Buy")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(.white)
                        }
                }
                
                HStack(spacing: 2) {
                    Image(systemName: "dollarsign.circle.fill")
                    Text(h.cost.description)
                }
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundStyle(.orange)
                .padding(.horizontal)
            }
            .padding([.horizontal, .bottom])
        }
        .background {
            Color.black.opacity(0.85).ignoresSafeArea()
        }
    }
    
    @MainActor
    @ViewBuilder
    private func bubbleTeaRow(_ h: BubbleTeaCard) -> some View {
        HStack {
            image(h)
                .padding(.trailing)
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    Text(h.name)
                        .font(.title3)
                        .minimumScaleFactor(0.75)
                        .fontWeight(.bold)
                    
                    Spacer(minLength: 0)
                }
                
                HStack(spacing: 15) {
                    HStack(spacing: 0) {
                        Image(systemName: "dollarsign")
                            .font(.subheadline)
                        Text(h.cost.description)
                    }
                    .foregroundStyle(Color.orange)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "heart.fill")
                        Text(h.health.description)
                    }
                    .foregroundStyle(.red)
                    
                    HStack(spacing: 0) {
                        Image(systemName: "bolt.circle.fill")
                        Text(h.power.description)
                    }
                    .foregroundStyle(.brown)
                }
                .fontWeight(.bold)
                
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
