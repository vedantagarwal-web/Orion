import Foundation

struct CartItem: Identifiable {
    let id: UUID
    let event: Event
    var quantity: Int
    
    init(id: UUID = UUID(), event: Event, quantity: Int) {
        self.id = id
        self.event = event
        self.quantity = quantity
    }
}
