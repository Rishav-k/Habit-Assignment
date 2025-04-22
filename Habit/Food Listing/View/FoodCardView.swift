//
//  FoodCardView.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct FoodCardView: View {
    let food: FoodItem
    @EnvironmentObject var cartVM: CartViewModel

    @State private var isAdded = false
    @State private var quantity = 1

    var body: some View {
        HStack(alignment: .top, spacing: 16) {
            // Left Side
            VStack(alignment: .leading, spacing: 8) {
                Text(food.name)
                    .font(.system(size: 18, weight: .bold))
                    .lineLimit(1)
                    .foregroundColor(.black)

                Text("Serves 1 | ")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundColor(.gray)
                +
                Text(food.description)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)

                Text("₹\(food.price + 50)")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.gray)
                    .strikethrough(true, color: .gray)
                +
                Text(" ₹\(food.price)")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.black)

                Spacer()
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 16)

            // Right Side
            ZStack(alignment: .bottom) {
                AsyncImage(url: URL(string: food.image)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 140, height: 100)
                            .clipped()
                            .cornerRadius(10)
                    } else if phase.error != nil {
                        Color.red
                            .frame(width: 140, height: 100)
                            .cornerRadius(10)
                    } else {
                        ProgressView()
                            .frame(width: 140, height: 100)
                    }
                }

                VStack {
                    if isAdded {
                        HStack(spacing: 12) {
                            Button(action: {
                                if quantity > 1 {
                                    quantity -= 1
                                    cartVM.decreaseQuantity(for: food)
                                } else {
                                    isAdded = false
                                    quantity = 1
                                    cartVM.decreaseQuantity(for: food)
                                }
                            }) {
                                Image(systemName: "minus")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 12))
                            }

                            Text("\(quantity)")
                                .font(.system(size: 12))
                                .foregroundColor(.white)

                            Button(action: {
                                quantity += 1
                                cartVM.addToCart(food: food)
                            }) {
                                Image(systemName: "plus")
                                    .foregroundColor(Color.white)
                                    .font(.system(size: 12))
                            }
                        }
                        .padding(.horizontal, 8)
                        .padding(.vertical, 3)
                        .background(Color.violet.opacity(0.5))
                        .cornerRadius(8)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.violet1, lineWidth: 0.8)
                        )
                    } else {
                        Button(action: {
                            isAdded = true
                            quantity = 1
                            cartVM.addToCart(food: food)
                        }) {
                            Text("ADD")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 8)
                                .background(Color.violet3)
                                .cornerRadius(8)
                        }
                    }
                }
                .offset(y: 20)
                .shadow(radius: 5)
            }
            .frame(width: 140, height: 140)
        }
        .padding(.top, 16)
        .background(Color.white)
        .cornerRadius(12)
        .overlay(
            VStack {
                HStack {
                    ZStack {
                        Rectangle()
                            .stroke(food.isVeg ? Color.green : Color.red, lineWidth: 1)
                            .frame(width: 16, height: 16)
                        Circle()
                            .fill(food.isVeg ? Color.green : Color.red)
                            .frame(width: 8, height: 8)
                    }
                    .padding(.top, 6)

                    Image(systemName: "flame.fill")
                        .font(.system(size: 10, weight: .bold))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .foregroundColor(Color.blue)
                        .background(Color.violet2)
                        .cornerRadius(6)
                        .padding(.top, 6)

                    Text("50% OFF")
                        .font(.system(size: 10, weight: .bold))
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .foregroundColor(.violet1)
                        .background(Color.violet2)
                        .cornerRadius(6)
                        .padding([.top, .trailing], 6)

                    Spacer()
                }

                Spacer()
            }
        )
    }
}
