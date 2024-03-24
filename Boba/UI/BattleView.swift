import SwiftUI
import SDWebImage
import SDWebImageSwiftUI

struct BattleView: View {
    @State private var speed: TimeInterval = 0.3
    @State private var far: CGFloat = 200
    @State private var router: Int = 0
    
    @State private var trigger0: Bool = false
    @State private var trigger1: Bool = false
    @State private var trigger2: Bool = false
    @State private var trigger3: Bool = false
    @State private var trigger4: Bool = false
    @State private var trigger5: Bool = false
    @State private var trigger6: Bool = false
    @State private var trigger7: Bool = false
    @State private var trigger8: Bool = false
    @State private var trigger9: Bool = false
    
    @State private var timer0: Timer?
    @State private var timer1: Timer?
    @State private var timer2: Timer?
    @State private var timer3: Timer?
    @State private var timer4: Timer?
    @State private var timer5: Timer?
    @State private var timer6: Timer?
    @State private var timer7: Timer?
    @State private var timer8: Timer?
    @State private var timer9: Timer?
    
    var body: some View {
        ZStack {
            VStack(spacing: 5) {
                HStack(alignment: .top) {
                    leftPanel()
                    Spacer()
                    rightPanel()
                }
                .padding(.top)
                .padding(.horizontal, 5)
                
                battleStage()
                Spacer()
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
    private func battleStage() -> some View {
        VStack {
            Spacer()
            ZStack {
                HStack {
                    Spacer()
                    hero()
                        .overlay {
                            hero(shadow: false)
                                .colorMultiply(.green.opacity(0.5))
                        }
                }
                HStack {
                    ZStack {
                        heroBattle()
                            .onTapGesture {
                                tapHandler()
                            }
                        
                        ZStack {
                            ShootView(shoot: $trigger0, far: far, d: speed)
                                .opacity(trigger0 ? 1 : 0)
                            ShootView(shoot: $trigger1, far: far, d: speed)
                                .opacity(trigger1 ? 1: 0)
                            ShootView(shoot: $trigger2, far: far, d: speed)
                                .opacity(trigger2 ? 1: 0)
                            ShootView(shoot: $trigger3, far: far, d: speed)
                                .opacity(trigger3 ? 1: 0)
                            ShootView(shoot: $trigger4, far: far, d: speed)
                                .opacity(trigger4 ? 1: 0)
                            ShootView(shoot: $trigger5, far: far, d: speed)
                                .opacity(trigger5 ? 1: 0)
                            ShootView(shoot: $trigger6, far: far, d: speed)
                                .opacity(trigger6 ? 1: 0)
                            ShootView(shoot: $trigger7, far: far, d: speed)
                                .opacity(trigger7 ? 1: 0)
                            ShootView(shoot: $trigger8, far: far, d: speed)
                                .opacity(trigger8 ? 1: 0)
                            ShootView(shoot: $trigger9, far: far, d: speed)
                                .opacity(trigger9 ? 1: 0)
                        }
                        .offset(x: 20)
                    }
                    Spacer()
                }
            }
            Spacer()
        }
        .padding(.horizontal)
    }
    
    @MainActor
    @ViewBuilder
    private func heroBattle(shadow: Bool = true) -> some View {
        WebImage(url: URL(string: Bundle.main.url(forResource: "BubbleTeaHeroBattle", withExtension: "gif")!.relativeString)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .shadow(color: .black.opacity(0.2), radius: shadow ? 15 : 0, y: 5)
                    .frame(width: 150)
            } placeholder: {
                    Rectangle().fill(.gray)
            }
    }
    
    @MainActor
    @ViewBuilder
    private func heroBattle2(shadow: Bool = true) -> some View {
        Image("BubbleTeaBattle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black.opacity(0.2), radius: shadow ? 15 : 0, y: 5)
            .frame(width: 150)
    }
    
    @MainActor
    @ViewBuilder
    private func hero(shadow: Bool = true) -> some View {
        Image("BubbleTeaHero")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .shadow(color: .black.opacity(0.2), radius: shadow ? 15 : 0, y: 5)
            .frame(width: 100)
    }
    
    @MainActor
    @ViewBuilder
    private func leftPanel() -> some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack {
                ForEach(1...1, id: \.self) { _ in
                    HStack(spacing: 0)  {
                        ForEach(1...5, id: \.self) { _ in
                            Image(systemName: "heart.fill")
                        }
                    }
                }
            }
            .foregroundColor(.red)

            HStack(spacing: 5) {
                Image(systemName: "bolt.circle.fill")
                Text("10")
            }
            .foregroundStyle(.brown)
        }
        .font(.title2)
        .fontWeight(.bold)
        .padding(.horizontal)
    }
    
    @MainActor
    @ViewBuilder
    private func rightPanel() -> some View {
        VStack(alignment: .trailing, spacing: 10) {
            VStack {
                ForEach(1...3, id: \.self) { _ in
                    HStack(spacing: 0)  {
                        ForEach(1...5, id: \.self) { _ in
                            Image(systemName: "heart.fill")
                        }
                    }
                }
                
                ForEach(1...2, id: \.self) { _ in
                    HStack(spacing: 0)  {
                        ForEach(1...5, id: \.self) { _ in
                            Image(systemName: "heart")
                        }
                    }
                }
            }
            .foregroundColor(.red)

            HStack(spacing: 5) {
                Image(systemName: "bolt.circle.fill")
                Text("2")
            }
            .foregroundStyle(.brown)
        }
        .font(.title2)
        .fontWeight(.bold)
        .padding(.horizontal)
    }
    
    @MainActor
    @ViewBuilder
    private func heartPanel() -> some View {
        HStack(alignment: .top) {
            VStack(spacing: 0) {
                HStack(spacing: 0)  {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "heart.fill")
                    }
                }
            }
            Spacer()
            VStack(spacing: 0) {
                HStack(spacing: 0)  {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "heart.fill")
                    }
                }
                HStack(spacing: 0)  {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "heart.fill")
                    }
                }
                HStack(spacing: 0)  {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "heart.fill")
                    }
                }
                HStack(spacing: 0)  {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "heart")
                    }
                }
                HStack(spacing: 0)  {
                    ForEach(1...5, id: \.self) { _ in
                        Image(systemName: "heart")
                    }
                }
            }
        }
        .font(.title2)
        .foregroundColor(.red)
        .padding(.horizontal)
    }
    
    @MainActor
    @ViewBuilder
    private func powerPanel() -> some View {
        HStack {
            VStack {
                HStack(spacing: 5) {
                    Image(systemName: "bolt.circle.fill")
                    Text("10")
                }
            }
            Spacer()
            HStack(spacing: 5) {
                Image(systemName: "bolt.circle.fill")
                Text("2")
            }
        }
        .foregroundStyle(.brown)
        .font(.title2)
        .fontWeight(.bold)
        .foregroundColor(.brown)
        .padding(.horizontal)
    }
    
    @MainActor
    @ViewBuilder
    private func bg() -> some View {
        WebImage(url: URL(string: Bundle.main.url(forResource: "BattleSeaBackground", withExtension: "gif")!.relativeString)) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .offset(y: -50)
            } placeholder: {
                    Rectangle().fill(.gray)
            }
            .ignoresSafeArea()
    }
    
    @MainActor
    @ViewBuilder
    private func fg() -> some View {
        EmptyView()
    }
}

extension BattleView {
    func tapHandler() {
        switch router {
        case 0:
            trigger0 = true
            timer0 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger0 = false
                timer0 = nil
            })
        case 1:
            trigger1 = true
            timer1 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger1 = false
                timer1 = nil
            })
        case 2:
            trigger2 = true
            timer2 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger2 = false
                timer2 = nil
            })
        case 3:
            trigger3 = true
            timer3 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger3 = false
                timer3 = nil
            })
        case 4:
            trigger4 = true
            timer4 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger4 = false
                timer4 = nil
            })
        case 5:
            trigger5 = true
            timer5 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger5 = false
                timer5 = nil
            })
        case 6:
            trigger6 = true
            timer6 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger6 = false
                timer6 = nil
            })
        case 7:
            trigger7 = true
            timer7 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger7 = false
                timer7 = nil
            })
        case 8:
            trigger8 = true
            timer8 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger8 = false
                timer8 = nil
            })
        default:
            trigger9 = true
            timer9 = Timer.scheduledTimer(withTimeInterval: speed+0.05, repeats: false, block: { _ in
                trigger9 = false
                timer9 = nil
            })
        }
        
        router += 1
        if router >= 10 {
            router = 0
        }
    }
}

#if DEBUG
#Preview {
    BattleView()
}
#endif
