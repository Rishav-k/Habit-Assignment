//
//  TTLSectionView.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct TTLSectionView: View {
    let title: String
    let onViewAllTapped: () -> Void
    let cards: [TTLCardViewModel]

    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Text(title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(Color.violet1)

                Spacer()
                Button(action: onViewAllTapped) {
                    Text("View All")
                        .font(.system(size: 14, weight: .medium))
                        .underline(true, color: Color.violet1)
                        .foregroundColor(Color.violet1)
                }

            }
            .padding(.horizontal)
            .padding(.vertical)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(cards) { card in
                        TTLCardView(card: card)
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}
