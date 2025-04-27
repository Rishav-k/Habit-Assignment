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
    @Published var totalItemCount: Int = 0
    
    var totalPrice: Double {
        cartItems.reduce(0) { $0 + (Double($1.food.price) * Double($1.quantity)) }
    }
    
    // Call this method whenever cart items change
    private func updateTotalItemCount() {
        totalItemCount = cartItems.reduce(0) { $0 + $1.quantity }
    }
    func setQuantity(for food: FoodItem, quantity: Int) {
          if let index = cartItems.firstIndex(where: { $0.food.name == food.name }) {
              if quantity > 0 {
                  cartItems[index].quantity = quantity
              } else {
                  // If the quantity is set to 0 or less, remove the item from the cart
                  cartItems.remove(at: index)
              }
          } else if quantity > 0 {
              // If the item is not in the cart, add it with the specified quantity
              cartItems.append(CartItem(food: food, quantity: quantity))
          }
          updateTotalItemCount()
      }

    func addToCart(food: FoodItem) {
        if let index = cartItems.firstIndex(where: { $0.food.name == food.name }) {
            cartItems[index].quantity += 1
        } else {
            cartItems.append(CartItem(food: food, quantity: 1))
        }
        updateTotalItemCount()  // Ensure total is updated
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
        updateTotalItemCount()  // Ensure total is updated
    }
    func getQuantity(for food: FoodItem) -> Int {
            if let index = cartItems.firstIndex(where: { $0.food.name == food.name }) {
                return cartItems[index].quantity
            }
            return 0  // Return 0 if the food item is not in the cart
        }

    func increaseQuantity(for item: CartItem) {
        if let index = cartItems.firstIndex(of: item) {
            cartItems[index].quantity += 1
        }
        updateTotalItemCount()  // Ensure total is updated
    }

    func decreaseQuantityItem(for item: CartItem) {
        if let index = cartItems.firstIndex(of: item) {
            if cartItems[index].quantity > 1 {
                cartItems[index].quantity -= 1
            } else {
                cartItems.remove(at: index)
            }
        }
        updateTotalItemCount()  // Ensure total is updated
    }
}
