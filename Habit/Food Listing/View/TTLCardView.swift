//
//  TTLCardView.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct TTLCardView: View {
    let card: TTLCardViewModel
    @EnvironmentObject var cartVM: CartViewModel
    @State private var isAdded = false  // Track if the item has been added to the cart

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: card.imageUrl)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 140)
                            .clipped()
                            .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                    case .failure:
                        Color.red
                            .frame(width: 150, height: 140)
                            .cornerRadius(10)
                    case .empty:
                        ProgressView()
                            .frame(width: 150, height: 140)
                    @unknown default:
                        Color.gray
                            .frame(width: 150, height: 140)
                            .cornerRadius(10)
                    }
                }
                .overlay(
                    VStack {
                        VStack(spacing: 0) {
                            Text("20%")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Color.violet1)
                                .padding(.horizontal, 6)
                                .padding(.top, 6)
                            
                            Text("OFF")
                                .font(.system(size: 10, weight: .bold))
                                .foregroundColor(Color.violet1)
                                .padding(.horizontal, 6)
                                .padding(.bottom, 6)
                        }
                        .background(Color.violet2)
                        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
                        .padding(.leading, 10)
                        
                        Spacer()
                    },
                    alignment: .topLeading
                )
                .overlay(
                    VStack {
                        Spacer()
                        HStack {
                            ZStack {
                                Rectangle()
                                    .stroke(Color(card.isVeg ? .green : .red), lineWidth: 1)
                                    .frame(width: 14, height: 14)
                                
                                Circle()
                                    .fill(Color(card.isVeg ? .green : .red))
                                    .frame(width: 8, height: 8)
                            }
                            Spacer()
                        }
                        .padding(10)
                    },
                    alignment: .bottomLeading
                )
            }
            
            Spacer()
            
            VStack(alignment: .leading, spacing: 4) {
                // Name with 2 lines
                Text(card.name)
                    .font(.system(size: 16, weight: .semibold))
                    .lineLimit(2)
                    .fixedSize(horizontal: false, vertical: true)
                
                // Price and Add button in a row
                HStack {
                    VStack{
                        Text("₹\(card.price + 50)")
                            .font(.system(size: 11, weight: .semibold))
                            .foregroundColor(.gray)
                            .strikethrough(true, color: .gray)
                        Text("₹\(card.price)")
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundColor(.black)
                    }
                    
                    Spacer()
                    
                    VStack {
                        let quantity = cartVM.getQuantity(for: FoodItem(from: card)) // Get the quantity from the cartVM

                        if quantity > 0 {
                            // Show Added state with quantity buttons
                            HStack(spacing: 0) {
                                Button(action: {
                                    cartVM.decreaseQuantity(for: FoodItem(from: card))
                                }) {
                                    Image(systemName: "minus")
                                        .foregroundColor(.green)
                                }

                                Text("\(quantity)")
                                    .font(.headline)
                                    .frame(minWidth: 10, alignment: .center)
                                
                                Button(action: {
                                    cartVM.addToCart(food: FoodItem(from: card))
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.horizontal, 5)
                            .background(Color.green.opacity(0.1))
                            .cornerRadius(8)
                            .overlay(
                                RoundedRectangle(cornerRadius: 4)
                                    .stroke(Color.green.opacity(0.9), lineWidth: 0.5)
                            )
                        } else {
                            Button(action: {
                                isAdded = true
                                cartVM.addToCart(food: FoodItem(from: card))
                            }) {
                                Text("Add")
                                    .font(.system(size: 12, weight: .bold))
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 4)
                                    .background(Color.violet1)
                                    .foregroundColor(.white)
                                    .cornerRadius(6)
                            }
                            .padding(.bottom, 5)
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.bottom, 8)
        }
        .padding(.vertical)
        .frame(width: 140, height: 230)
        .background(Color.violet2)
        .cornerRadius(12)
    }
}
