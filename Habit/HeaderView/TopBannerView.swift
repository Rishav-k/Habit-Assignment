//
//  TopBannerView.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct TopBannerView: View {
    var body: some View {
        VStack(spacing: 15) {
            VStack(spacing: 5) {
                Text("HABIT")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(Color.violet1)
                
                Text("Fresh Food Delivered within 15 Minutes")
                    .font(.subheadline)
                    .foregroundColor(Color.violet1)
                    .padding(.bottom , 20)
                
                // Cards Section
                HStack(spacing: 16) {
                    CardView(subtitle: "Some description here", imageUrl: "https://thumbs.dreamstime.com/b/delicate-delight-exploring-exquisite-textures-hues-purple-dessert-stunning-soft-focus-photography-indulge-your-373506048.jpg")
                    CardView(subtitle: "Some description here", imageUrl: "https://thumbs.dreamstime.com/b/delicate-delight-exploring-exquisite-textures-hues-purple-dessert-stunning-soft-focus-photography-indulge-your-373506048.jpg")
                    CardView( subtitle: "Some description here", imageUrl: "https://thumbs.dreamstime.com/b/delicate-delight-exploring-exquisite-textures-hues-purple-dessert-stunning-soft-focus-photography-indulge-your-373506048.jpg")
                }
                .padding(.horizontal,10)
            }
            .padding(.top)
        }
    }
}



struct CardView: View {
    var subtitle: String
    var imageUrl: String

    var body: some View {
        VStack(alignment: .center, spacing: 8) {
            AsyncImage(url: URL(string: imageUrl)) { phase in
                if let image = phase.image {
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 80)
                        .clipped()
                        .cornerRadius(8)
                } else if phase.error != nil {
                    Color.red
                        .frame(width: 100, height: 80)
                        .cornerRadius(8)
                } else {
                    ProgressView()
                        .frame(width: 100, height: 80)
                }
            }
        }
        .cornerRadius(10)
        .shadow(radius: 5)
    }
}
