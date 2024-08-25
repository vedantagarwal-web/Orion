import SwiftUI

struct EventDetailView: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var quantity = 1
    @State private var showingReviewSheet = false
    
    let event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(event.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(event.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text(event.date, style: .date)
                    }
                    .foregroundColor(.gray)
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text(event.venue)
                    }
                    .foregroundColor(.gray)
                    
                    Text(event.description)
                        .padding(.top)
                    
                    HStack {
                        Text("Price: $\(event.price, specifier: "%.2f")")
                            .fontWeight(.semibold)
                        Spacer()
                        Stepper("Quantity: \(quantity)", value: $quantity, in: 1...10)
                    }
                    .padding(.top)
                    
                    CustomButton(title: "Add to Cart") {
                        cartViewModel.addToCart(event, quantity: quantity)
                    }
                    .padding(.top)
                    
                    if !event.reviews.isEmpty {
                        ReviewView(reviews: event.reviews)
                    }
                    
                    CustomButton(title: "Write a Review") {
                        showingReviewSheet = true
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .navigationTitle("Event Details")
        .navigationBarItems(trailing: Button(action: {
            userViewModel.toggleFavorite(event)
        }) {
            Image(systemName: userViewModel.isFavorite(event) ? "heart.fill" : "heart")
        })
        .sheet(isPresented: $showingReviewSheet) {
            // Add ReviewFormView here
        }
    }
}
