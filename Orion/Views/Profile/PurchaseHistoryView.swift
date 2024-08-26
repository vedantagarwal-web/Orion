import SwiftUI

struct PurchaseHistoryView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    // This would typically come from a separate view model or service
    let purchaseHistory: [PurchaseItem] = [
        PurchaseItem(event: Event(title: "Penang Food Festival",
                                  date: Date(),
                                  venue: "George Town",
                                  location: "Penang",
                                  description: "Celebrate Penang's rich culinary heritage",
                                  price: 149.99,
                                  image: "event_food",
                                  category: "Food"),
                     purchaseDate: Date().addingTimeInterval(-86400 * 7),
                     quantity: 2),
        PurchaseItem(event: Event(title: "Malaysia Tech Week",
                                  date: Date().addingTimeInterval(86400 * 30),
                                  venue: "Kuala Lumpur Convention Centre",
                                  location: "Kuala Lumpur",
                                  description: "Malaysia's premier technology conference",
                                  price: 599.99,
                                  image: "event_tech",
                                  category: "Technology"),
                     purchaseDate: Date().addingTimeInterval(-86400 * 14),
                     quantity: 1)
    ]
    
    var body: some View {
        List {
            ForEach(purchaseHistory) { item in
                VStack(alignment: .leading) {
                    Text(item.event.title)
                        .font(.headline)
                    Text("Purchased on: \(item.purchaseDate.formattedShortDate)")
                        .font(.subheadline)
                    Text("Quantity: \(item.quantity)")
                        .font(.subheadline)
                    Text("Total: $\(item.event.price * Double(item.quantity), specifier: "%.2f")")
                        .font(.subheadline)
                }
            }
        }
        .navigationTitle("Purchase History")
        .listStyle(PlainListStyle())
    }
}

struct PurchaseItem: Identifiable {
    let id = UUID()
    let event: Event
    let purchaseDate: Date
    let quantity: Int
}
