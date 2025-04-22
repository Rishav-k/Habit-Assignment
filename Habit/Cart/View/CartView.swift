//
//  CartView.swift
//  Habit
//
//  Created by Rishav Kumar on 22/04/25.
//

import SwiftUI

struct CartView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var cartViewModel: CartViewModel
    @State private var showOfferSheet = false
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.black)
                        .padding()
                }
                
                Text("Your Cart")
                    .font(.title3)
                    .fontWeight(.bold)
                    .padding(.leading, 8)
                    .padding(.trailing, 10)
                
                if cartViewModel.totalItemCount != 0 {
                    Text("You Saved ₹\(cartViewModel.totalItemCount * 50)")
                        .font(.system(size: 14, weight: .bold))
                        .padding(.horizontal)
                        .padding(.vertical, 3)
                        .foregroundColor(Color.violet1)
                        .background(Color.violet4)
                        .cornerRadius(10)
                }
                
                Spacer()
            }
            .background(.white)
            
            VStack {
                Text("🚴‍♂️ Get your food in 10 minutes!")
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.violet1)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.violet2)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.vertical)
                
                if cartViewModel.cartItems.isEmpty {
                    Spacer()
                    Text("Your cart is empty")
                        .foregroundColor(.gray)
                    Spacer()
                } else {
                    ScrollView {
                        ForEach(cartViewModel.cartItems) { item in
                            CartItemView(item: item, cartViewModel: cartViewModel)
                        }
                        
                        
                        // "Add More Items" Button
                        Button(action: {
                            presentationMode.wrappedValue.dismiss()
                        }) {
                            HStack {
                                Image(systemName: "plus")
                                    .font(.system(size: 14, weight: .semibold))
                                    .foregroundColor(.green)
                                Text("Add items")
                                    .fontWeight(.semibold)
                                    .foregroundColor(.green)
                                Spacer()
                            }
                            .padding(10)
                            .padding(.leading,5)
                        }
                    }
                    
                }
            }
            .background(.white)
            .cornerRadius(16)
            .padding(10)
            
            // Offer For You Section
            if !cartViewModel.cartItems.isEmpty{
                VStack {
                    
                    HStack {
                        Text("OFFER FOR YOU")
                            .font(.system(size: 14))
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                            .padding(.bottom,6)
                        Spacer()
                        
                        Button(action: {
                            showOfferSheet.toggle()
                        }) {
                            Text("view all coupouns")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                            Image(systemName: "chevron.right")
                                .font(.system(size: 14))
                                .foregroundColor(.gray)
                        }
                    }
                    
                    // Single offer visible initially
                    HStack {
                        Image(systemName: "checkmark.seal")
                            .foregroundColor(.green)
                        
                        Text("Exclusive Offer:")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                        
                        Spacer()
                        
                        Text("20% off")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.horizontal)
            }
            // Payment Summary Section
            if !cartViewModel.cartItems.isEmpty{
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "house")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, -5)
                        
                        VStack(alignment: .leading) {
                            Text("Deliver To:")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            Text("John Doe, 123, XYZ Street, City, Country")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        Image(systemName: "chevron.right")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .padding(.top, -5)
                    }
                    
                    Divider()
                    
                    HStack{
                        Image(systemName: "newspaper")
                            .font(.system(size: 13, weight: .semibold))
                            .padding(.vertical, 5)
                        
                        Text("Bill Summary")
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.vertical, 5)
                    }
                    
                    // GST
                    HStack {
                        Text("GST (18%)")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                        Spacer()
                        Text("₹\(cartViewModel.totalPrice * 0.18, specifier: "%.2f")")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                    }
                    
                    
                    // Delivery Cost
                    HStack {
                        Text("Delivery Cost")
                            .font(.system(size: 12))
                            .fontWeight(.semibold)
                            .foregroundColor(.gray)
                        
                        Spacer()
                        Text("₹50")
                            .font(.system(size: 12))
                            .foregroundColor(.black)
                    }
                    
                    Divider()
                    
                    // Final Total
                    HStack {
                        Text("Final Total:")
                            .font(.headline)
                            .fontWeight(.bold)
                            .foregroundColor(.gray)
                        Spacer()
                        Text("₹\(cartViewModel.totalPrice + (cartViewModel.totalPrice * 0.18) + 50, specifier: "%.2f")")
                            .font(.headline)
                            .fontWeight(.bold)
                    }
                    .padding(.top, 8)
                    
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .shadow(radius: 0.2)
                .padding(.horizontal)
            }
            
            Spacer()
            if !cartViewModel.cartItems.isEmpty {
                VStack{
                    Button(action: {
                        print("Proceed to payment")
                    }) {
                        Text("Pay ₹\(Int(cartViewModel.totalPrice + (cartViewModel.totalPrice * 0.18) + 50))")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding(8)
                            .frame(maxWidth: .infinity)
                            .background(Color.violet3)
                            .cornerRadius(12)
                            .padding(.horizontal)
                    }
                    .padding(.top)
                    .padding(.horizontal,5)
                }
                .background(.white)
                .shadow(radius: 3)
            }
        }
        .background(Color(.systemGroupedBackground).ignoresSafeArea())
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showOfferSheet) {
            OfferSheetView()
        }
    }
}
