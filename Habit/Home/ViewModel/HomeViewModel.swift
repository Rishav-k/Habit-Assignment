//
//  HomeViewModel.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//
import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var triedTastedLoved: [TTLCardViewModel] = []
    @Published var lookingForMore: [FoodItem] = []

    init() {
        loadFoodData()
    }

    func loadFoodData() {
        guard let url = Bundle.main.url(forResource: "data", withExtension: "json") else {
            print("⚠️ Could not find JSON")
            return
        }

        do {
            let data = try Data(contentsOf: url)
            let decodedData = try JSONDecoder().decode(FoodCategoryResponse.self, from: data)
            triedTastedLoved = decodedData.triedTastedLoved
            lookingForMore = decodedData.lookingForMore
        } catch {
            print("❌ Failed to decode JSON: \(error)")
        }
    }
}
