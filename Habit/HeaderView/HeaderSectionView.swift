//
//  HeaderSectionView.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct HeaderSectionView: View {
    @State private var searchText = "Search Food"
    @State private var isVegModeOn = true
    

    var body: some View {
        VStack(spacing: 20){
            TopInfoSection()
                .padding(.top,60)
            SearchBarView(searchText: $searchText, isVegModeOn: $isVegModeOn)
            TopBannerView()
        }
        .padding(.horizontal)
        .padding(.bottom, 30)
        .background(.yellow)
        .mask(
            RoundedCorner(radius: 80, corners: [.bottomLeft, .bottomRight])
        )

    }
}

#Preview {
    HeaderSectionView()
}
