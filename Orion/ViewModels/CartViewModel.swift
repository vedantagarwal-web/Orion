import Foundation
import Combine

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []
    
    var total: Double {
        cartItems.reduce(0) { $0 + $1.event.price * Double($1.quantity) }
    }
    
    func addToCart(_ event: Event, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.event.id == event.id }) {
            cartItems[index].quantity += quantity
        } else {
            cartItems.append(CartItem(event: event, quantity: quantity))
        }
    }
    
    func removeFromCart(at offsets: IndexSet) {
        cartItems.remove(atOffsets: offsets)
    }
    
    func updateQuantity(for item: CartItem, quantity: Int) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems[index].quantity = max(1, quantity)
        }
    }
    
    func clearCart() {
        cartItems.removeAll()
    }
}
