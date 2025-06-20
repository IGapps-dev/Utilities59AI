//
//  Untitled.swift
//  ForestDrop
//
//  Created by Константин Каменчуков on 17.06.2025.
//

import SwiftUI

struct BenefitsView: View {
    @StateObject var viewModel = BenefitsViewModel()
    @State private var currentIndex = 0

    var body: some View {
        VStack(spacing: 32) {
            let card = viewModel.cards[currentIndex]
            Image(systemName: card.symbol)
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.blue)
            Text(card.title).font(.title).bold()
            Text(card.message).font(.title2)
            Text(card.spiritPhrase).font(.headline).foregroundColor(.green)
            HStack {
                Button(action: {
                    if currentIndex > 0 { currentIndex -= 1 }
                }) {
                    Image(systemName: "chevron.left")
                }
                .disabled(currentIndex == 0)
                Spacer()
                Button(action: {
                    if currentIndex < viewModel.cards.count - 1 { currentIndex += 1 }
                }) {
                    Image(systemName: "chevron.right")
                }
                .disabled(currentIndex == viewModel.cards.count - 1)
            }
            .padding(.horizontal, 40)
        }
        .padding()
    }
}


