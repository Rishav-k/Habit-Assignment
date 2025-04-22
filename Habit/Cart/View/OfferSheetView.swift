//
//  OfferSheetView.swift
//  Habit
//
//  Created by Rishav Kumar on 22/04/25.
//

import SwiftUI

struct OfferSheetView: View {
    var body: some View {
        VStack {
            Text("Special Offers")
                .font(.title2)
                .fontWeight(.bold)
                .padding()
            
            Divider()
            
            // List of multiple offers
            VStack(alignment: .leading) {
                HStack {
                    Text("Exclusive Offer:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("20% off on next order!")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                Divider()
                HStack {
                    Text("Free Delivery:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("On orders above ₹500")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                Divider()
                HStack {
                    Text("Cashback Offer:")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Spacer()
                    Text("Get ₹100 cashback on ₹1000+ orders")
                        .font(.subheadline)
                        .foregroundColor(.green)
                }
                Divider()
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}
#Preview {
    OfferSheetView()
}
