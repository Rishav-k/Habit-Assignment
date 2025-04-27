//  CartManager.swift
//  Habit
//
//  Created by Rishav Kumar on 22/04/25.
//
import Foundation
import Combine

class CartManager: ObservableObject {
    static let shared = CartManager()
    private init() {}

    @Published var cartItems: [CartItem] = []
    @Published var totalItemCount: Int = 0  // ✅ Make it a published property

    var totalPrice: Double {
        cartItems.reduce(0) { $0 + (Double($1.food.price) * Double($1.quantity)) }
    }

    func addToCart(food: FoodItem) {
        if let index = cartItems.firstIndex(where: { $0.food.name == food.name }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(food: food, quantity: 1))
        }
        updateTotalItemCount()
    }
    
    func decreaseQuantity(for food: FoodItem) {
        if let index = cartItems.firstIndex(where: { $0.food.name == food.name }) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
        updateTotalItemCount()
    }

    func increaseQuantity(for item: CartItem) {
        if let index = cartItems.firstIndex(of: item) {
            cartItems[index].quantity += 1
        }
        updateTotalItemCount()
    }

    func decreaseQuantityItem(for item: CartItem) {
        if let index = cartItems.firstIndex(of: item) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
        updateTotalItemCount()
    }
    
    func clearCart() {
        cartItems.removeAll()
        updateTotalItemCount()
    }
    
    private func updateTotalItemCount() {
        totalItemCount = cartItems.reduce(0) { $0 + $1.quantity }
    }
}
