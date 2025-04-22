//
//  FoodCategoryResponse.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import Foundation


struct FoodCategoryResponse: Codable {
    let triedTastedLoved: [TTLCardViewModel]
    let lookingForMore: [FoodItem]
}

struct FoodItem: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let price: Int
    let image: String
    let rating: Double
    let isVeg: Bool
}


struct TTLCardViewModel: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let price: Int
    let imageUrl: String
    let rating: Double
    let isVeg: Bool
}

extension FoodItem {
    init(from ttlModel: TTLCardViewModel) {
        self.id = ttlModel.id
        self.name = ttlModel.name
        self.description = ttlModel.description
        self.price = ttlModel.price
        self.image = ttlModel.imageUrl
        self.rating = ttlModel.rating
        self.isVeg = ttlModel.isVeg
    }
}
