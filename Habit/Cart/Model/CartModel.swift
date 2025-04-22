//
//  CartModel.swift
//  Habit
//
//  Created by Rishav Kumar on 22/04/25.
//

import Foundation

class CartItem: ObservableObject, Identifiable, Equatable {
    static func == (lhs: CartItem, rhs: CartItem) -> Bool {
        lhs.food.name == rhs.food.name
    }

    let id = UUID()
    let food: FoodItem
    @Published var quantity: Int

    init(food: FoodItem, quantity: Int) {
        self.food = food
        self.quantity = quantity
    }
}
