import SwiftUI

struct CartItemView: View {
    @ObservedObject var item: CartItem
    var cartViewModel: CartViewModel
    @State private var isAdded = false  
    @State private var quantity = 1
    
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            // Veg/Non-Veg symbol
            VStack {
                ZStack {
                    // Square border
                    Rectangle()
                        .stroke(item.food.isVeg ? Color.green : Color.red, lineWidth: 1)
                        .frame(width: 14, height: 14)
                    
                    // Inner circle
                    Circle()
                        .fill(item.food.isVeg ? Color.green : Color.red)
                        .frame(width: 8, height: 8)
                }
            }
            .padding(.trailing, 5)
            .padding(.top, -5)
            
            // Food and price details
            VStack(alignment: .leading, spacing: 3) {
                // Food name
                Text(item.food.name)
                    .font(.headline)
                    .foregroundColor(.black)
                
                // Customization button like Swiggy
                Button(action: {
                    print("Customize \(item.food.name)")
                }) {
                    Text("Customisation available")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)
                    Image(systemName: "chevron.down")
                        .font(.system(size: 12, weight: .semibold))
                        .foregroundColor(.gray)                }
            }
            
            Spacer()
            
            // Quantity and total price section
            VStack(alignment: .trailing, spacing: 0) {
                // Quantity controls with background and border
                HStack(spacing: 5) {
                    Button(action: {
                        cartViewModel.decreaseQuantityItem(for: item)
                    }) {
                        Image(systemName: "minus")
                            .foregroundColor(.green)
                    }
                    
                    Text("\(item.quantity)")
                        .font(.headline)
                        .frame(minWidth: 20, alignment: .center)
                    
                    Button(action: {
                        cartViewModel.increaseQuantity(for: item)
                    }) {
                        Image(systemName: "plus")
                            .foregroundColor(.green)
                    }
                }
                .padding(.horizontal,5)
                .background(Color.green.opacity(0.1))
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.green.opacity(0.9), lineWidth: 0.5)
                )
            }
            // Total price for the item
            VStack{
                Text("₹\(item.food.price * (item.quantity))")
                    .font(.system(size: 12 , weight: .semibold))
                    .font(.headline)
                    .foregroundColor(.black)
                Text("₹\(item.food.price * (item.quantity) - 50*cartViewModel.totalItemCount)")
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                    .strikethrough(true, color: Color.gray)

            }
            
        }
        .padding()
        .background(Color.white)
        .cornerRadius(10)
        .padding(.bottom, 5)
    }
}
