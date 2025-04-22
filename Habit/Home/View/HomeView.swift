//
//  HomeView.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    init(viewModel: HomeViewModel = HomeViewModel()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationStack {
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    HeaderSectionView()

                    
                    TTLSectionView(
                        title: "TRIED, TASTED & LOVED",
                        onViewAllTapped: { print("View All tapped!") },
                        cards: viewModel.triedTastedLoved
                    )

                    
                    FoodListingView(foodItems: viewModel.lookingForMore)

                }
            }
            .background(Color.white)
            .ignoresSafeArea(edges: .top)
        }
    }
}
