import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryBrand.edgesIgnoringSafeArea(.all)
                
                if cartViewModel.cartItems.isEmpty {
                    Text("Your cart is empty")
                        .foregroundColor(.gray)
                } else {
                    List {
                        ForEach(cartViewModel.cartItems) { item in
                            CartItemRow(item: item)
                        }
                        .onDelete(perform: cartViewModel.removeFromCart)
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("Cart")
        }
    }
}


