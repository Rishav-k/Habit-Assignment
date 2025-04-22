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
    @State private var quantity = 1  // Track quantity of the item

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            ZStack(alignment: .topLeading) {
                AsyncImage(url: URL(string: card.imageUrl)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 150, height: 140)
                            .clipped()
                            .clipShape(
                                RoundedCorner(radius: 20, corners: [.topLeft, .topRight])
                            )
                    } else if phase.error != nil {
                        Color.red
                            .frame(width: 150, height: 140)
                            .cornerRadius(10)
                    } else {
                        ProgressView()
                            .frame(width: 150, height: 140)
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
                        .clipShape(
                            RoundedCorner(radius: 20, corners: [.bottomLeft, .bottomRight])
                        )
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
                        if isAdded {
                            // Show Added state with quantity buttons
//                            VStack(alignment: .trailing, spacing: 0)
                            HStack(spacing: 0) {
                                Button(action: {
                                    if quantity > 1 {
                                        quantity -= 1
                                        cartVM.decreaseQuantity(for: FoodItem(from: card))
                                    } else {
                                        isAdded = false
                                        quantity = 0
                                    }
                                }) {
                                    Image(systemName: "minus")
                                        .foregroundColor(.green)
                                }

                                Text("\(quantity)")
                                    .font(.headline)
                                    .frame(minWidth: 10, alignment: .center)

                                Button(action: {
                                    quantity += 1
                                    cartVM.addToCart(food: FoodItem(from: card))
                                }) {
                                    Image(systemName: "plus")
                                        .foregroundColor(.green)
                                }
                            }
                            .padding(.horizontal,5)
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
