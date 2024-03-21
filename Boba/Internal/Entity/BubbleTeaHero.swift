import SwiftUI

struct BubbleTeaHero {
    let name: String
    let image: String
    let health: Int
    let power: Int
    let cost: Int
    let detail: String
}

extension BubbleTeaHero: Identifiable {
    var id: String { return name }
}

extension BubbleTeaHero {
    static let data: [BubbleTeaHero] = [
        BubbleTeaHero(
            name: "Bubble Tea",
            image: "BubbleTea",
            health: 5,
            power: 15,
            cost: 5,
            detail: """
A pure bubble tea.
Made by pure black tea.
Pure happiness.
"""),
        BubbleTeaHero(
            name: "Bubble GreenTea",
            image: "BubbleTea",
            health: 25,
            power: 2,
            cost: 6,
            detail: """
A pure bubble green tea.
Made by pure green tea.
Pure happiness.
"""),
        BubbleTeaHero(
            name: "Bubble Oolong Tea",
            image: "BubbleTea",
            health: 10,
            power: 7,
            cost: 9,
            detail: """
A pure bubble Oolong tea.
Made by pure Oolong tea.
Pure happiness.
"""),
        BubbleTeaHero(
            name: "Bubble Milk Tea",
            image: "BubbleTea",
            health: 15,
            power: 8,
            cost: 12,
            detail: """
A pure bubble milk tea.
Made by pure milk tea.
Pure happiness.
"""),
        BubbleTeaHero(
            name: "Bubble Lemon Tea",
            image: "BubbleTea",
            health: 15,
            power: 8,
            cost: 12,
            detail: """
A pure bubble lemon tea.
Made by pure lemon tea.
Pure happiness.
""")
    ]
}
