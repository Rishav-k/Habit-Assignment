//
//  SearchBarView.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    @Binding var isVegModeOn: Bool

    var body: some View {
        HStack(spacing: 12) {
            HStack {
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .foregroundColor(.black)
                TextField("Search food or restaurants", text: $searchText)
                    .font(.custom("Lato-Regular", size: 18))
                    .foregroundColor(.gray)
            }
            .padding(.horizontal)
            .padding(.vertical, 16)
            .background(Color(.systemGray6))
            .cornerRadius(10)
            
            VStack{
                
                Text("VEG")
                    .font(.custom("Lato-Regular", size: 12))
                    .foregroundColor(Color.init(hex: "#4F1C51"))

                Text("MODE")
                    .font(.custom("Lato-Regular", size: 9))
                    .foregroundColor(Color.init(hex: "#4F1C51"))

                Toggle("", isOn: $isVegModeOn)
                    .toggleStyle(SwitchToggleStyle(tint: .green))
                    .frame(width: 40, height: 20)
                    .scaleEffect(0.6)

            }
            
        }
        .padding(.horizontal, 8)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    @State static var searchText = "Search Food"
    @State static var isVegModeOn = true

    static var previews: some View {
        SearchBarView(searchText: $searchText, isVegModeOn: $isVegModeOn)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
