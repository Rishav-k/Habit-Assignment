//
//  FoodListingView.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct FoodListingView: View {
    let foodItems: [FoodItem]

    var body: some View {
        VStack(alignment: .leading) {
            Text("LOOKING FOR EVEN MORE?")
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(Color.violet1)
                .padding(.leading, 20)


            ScrollView {
                    VStack(spacing: 0) {
                        ForEach(Array(foodItems.enumerated()), id: \.element.id) { index, food in
                            VStack(spacing: 0) {
                                FoodCardView(food: food)
                                
                                if index < foodItems.count - 1 {
                                    HorizontalLine(color: .gray, height: 1, padding: EdgeInsets(top: 5, leading: 16, bottom: 15, trailing: 16))
                                }
                            }
                        }
                    }
                .padding(.horizontal)
            }
        }
        .padding(.top, 8)
    }
}

//#Preview {
//    FoodListingView(foodItems: [
//        FoodItem(name: "Burger", description: "Spicy burger with crispy fries", price: 149.99, imageName: "burger"),
//        FoodItem(name: "Pizza", description: "Cheesy pizza with extra toppings", price: 249.99, imageName: "pizza"),
//        FoodItem(name: "Pasta", description: "Delicious Italian pasta with white sauce", price: 199.99, imageName: "pasta"),
//        FoodItem(name: "Salad", description: "Healthy green salad with dressing", price: 99.99, imageName: "salad")
//    ])
//}
