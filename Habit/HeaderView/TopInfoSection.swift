//
//  TopInfoSection.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct TopInfoSection: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @State private var navigateToCart = false

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 0) {
                Text("10")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color.init(hex: "#4F1C51"))
                    .foregroundColor(.purple)
                +
                Text(" minutes")
                    .font(.system(size: 20, weight: .regular))
                    .foregroundColor(Color.init(hex: "#4F1C51"))
                    .fontWeight(.heavy)
                    .foregroundColor(.purple)

                AddressView()
                    .padding(.top, -5)
            }

            Spacer()

            // Navigation Link triggered by state
            NavigationLink(destination: CartView(cartViewModel: cartViewModel), isActive: $navigateToCart) {
                EmptyView()
            }
            .hidden()

            // Cart icon with badge
            Button(action: {
                navigateToCart = true
            }) {
                ZStack(alignment: .topTrailing) {
                    Image(systemName: "cart")
                        .resizable()
                        .foregroundColor(Color.init(hex: "#4F1C51"))
                        .frame(width: 28, height: 28)
                        .foregroundColor(.purple)

                    if cartViewModel.totalItemCount > 0 {
                        Text("\(cartViewModel.totalItemCount)")
                            .font(.caption2)
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Color.red)
                            .clipShape(Circle())
                            .offset(x: 10, y: -10)
                    }
                }
            }
            .padding(.horizontal, 12)
            .padding(.vertical, 8)

            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .foregroundColor(Color.init(hex: "#4F1C51"))
                .frame(width: 30, height: 30)
        }
        .padding(.horizontal, 8)
        .background(Color.yellow)
    }
}


struct AddressView: View {
    var body: some View {
            
        HStack(spacing: 4){
            Image(systemName: "house.fill")
                .foregroundColor(Color.init(hex: "#4F1C51"))

            Text("Home")
                .font(.system(size: 16, weight: .semibold))
                .foregroundColor(Color.init(hex: "#4F1C51"))

            Text("•")
                .baselineOffset(1)
                .font(.system(size: 30, weight: .semibold))
                .foregroundColor(Color.init(hex: "#4F1C51"))


            Text("3rd Floor, Rock Castle")
                .font(.system(size: 14, weight: .semibold))
                .lineLimit(1)
                .foregroundColor(Color.init(hex: "#4F1C51"))

            Image(systemName: "chevron.down")
        }
        .foregroundColor(.purple)
        
    }
}

#Preview {
    TopInfoSection()
}
