import SwiftUI

struct PurchaseHistoryView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    // This would typically come from a separate view model or service
    let purchaseHistory: [PurchaseItem] = [
        PurchaseItem(event: Event(title: "Summer Festival", date: Date(), venue: "Central Park", location: "New York", description: "Annual summer music festival", price: 59.99, image: "summer_festival", category: "Music"), purchaseDate: Date().addingTimeInterval(-86400 * 7), quantity: 2),
        PurchaseItem(event: Event(title: "Tech Conference", date: Date().addingTimeInterval(86400 * 30), venue: "Convention Center", location: "San Francisco", description: "Annual tech conference", price: 199.99, image: "tech_conference", category: "Technology"), purchaseDate: Date().addingTimeInterval(-86400 * 14), quantity: 1)
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
