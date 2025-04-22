//
//  CartViewModel.swift
//  Habit
//
//  Created by Rishav Kumar on 22/04/25.
//

import Foundation
import Combine
class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []

    var totalItemCount: Int {
        cartItems.reduce(0) { $0 + $1.quantity }
    }

    var totalPrice: Double {
        cartItems.reduce(0) { $0 + (Double($1.food.price) * Double($1.quantity)) }
    }

    func addToCart(food: FoodItem) {
        if let index = cartItems.firstIndex(where: { $0.food.name == food.name }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(food: food, quantity: 1))
        }
    }
    
    func decreaseQuantity(for food: FoodItem) {
        if let index = cartItems.firstIndex(where: { $0.food.name == food.name }) {
            // If the quantity is more than 1, decrease it
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                // If quantity is 1, remove the item from the cart
                cartItems.remove(at: index)
            }
        }
    }

 
    func increaseQuantity(for item: CartItem) {
        if let index = cartItems.firstIndex(of: item) {
            cartItems[index].quantity += 1
        }
    }

    func decreaseQuantityItem(for item: CartItem) {
        if let index = cartItems.firstIndex(of: item) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
    }
}
