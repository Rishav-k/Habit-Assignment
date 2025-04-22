//
//  HabitApp.swift
//  Habit
//
//  Created by Rishav Kumar on 21/04/25.
//

import SwiftUI

@main
struct HabitApp: App {
    @StateObject var cartVM = CartViewModel()

    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(cartVM)
        }
    }
}
