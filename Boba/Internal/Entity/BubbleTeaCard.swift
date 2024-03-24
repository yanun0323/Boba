import SwiftUI

enum BubbleTeaCardCategory: Int, CaseIterable, Identifiable {
    case bubbleTea
    case bubbleGreenTea
    case bubbleOolongTea
    case bubbleMilkTea
    case bubbleLemonTea

    var id: Int { self.rawValue }
    
    var value: BubbleTeaCard {
        switch self {
        case .bubbleTea:
            return BubbleTeaCard(
                name: "Bubble Tea",
                image: "BubbleTeaHero",
                mutiColor: .clear,
                health: 5,
                power: 10,
                cost: 5,
                detail: """
    A pure bubble tea.
    Made by pure black tea.
    Pure happiness.
    """)
        case .bubbleGreenTea:
            return BubbleTeaCard(
                name: "Bubble Green Tea",
                image: "BubbleTeaHero",
                mutiColor: .green,
                health: 25,
                power: 2,
                cost: 6,
                detail: """
    A pure bubble green tea.
    Made by pure green tea.
    Pure happiness.
    """)
        case .bubbleOolongTea:
            return BubbleTeaCard(
                name: "Bubble Oolong Tea",
                image: "BubbleTeaHero",
                mutiColor: .brown,
                health: 10,
                power: 7,
                cost: 9,
                detail: """
    A pure bubble Oolong tea.
    Made by pure Oolong tea.
    Pure happiness.
    """)
        case .bubbleMilkTea:
            return BubbleTeaCard(
                name: "Bubble Milk Tea",
                image: "BubbleTeaHero",
                mutiColor: .white,
                health: 15,
                power: 8,
                cost: 12,
                detail: """
    A pure bubble milk tea.
    Made by pure milk tea.
    Pure happiness.
    """)
        case .bubbleLemonTea:
            return BubbleTeaCard(
                name: "Bubble Lemon Tea",
                image: "BubbleTeaHero",
                mutiColor: .yellow,
                health: 25,
                power: 10,
                cost: 20,
                detail: """
    A pure bubble lemon tea.
    Made by pure lemon tea.
    Pure happiness.
    """)
        }
    }
}

struct BubbleTeaCard {
    let name: String
    let image: String
    let mutiColor: Color
    let health: Int
    let power: Int
    let cost: Int
    let detail: String
}

extension BubbleTeaCard: Identifiable {
    var id: String { return name }
}
