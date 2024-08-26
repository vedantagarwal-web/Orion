import SwiftUI

struct EventDetailView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    let event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(systemName: event.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 200)
                    .foregroundColor(.purple)
                
                VStack(alignment: .leading, spacing: 10) {
                    Text(event.title)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    HStack {
                        Image(systemName: "calendar")
                        Text(event.date, style: .date)
                    }
                    .foregroundColor(.secondary)
                    
                    HStack {
                        Image(systemName: "mappin.and.ellipse")
                        Text(event.venue)
                    }
                    .foregroundColor(.secondary)
                    
                    Text(event.description)
                        .padding(.top)
                    
                    Text(CurrencyFormatter.formatPrice(event.price))
                        .font(.headline)
                        .padding(.top)
                    
                    HStack {
                        Button(action: {
                            userViewModel.toggleFavorite(event)
                        }) {
                            Image(systemName: userViewModel.isFavorite(event) ? "heart.fill" : "heart")
                                .foregroundColor(.red)
                        }
                        .padding(.trailing)
                        
                        Button(action: {
                            // Book ticket action
                        }) {
                            Text("Book Ticket")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(Color.purple)
                                .cornerRadius(10)
                        }
                    }
                    .padding(.top)
                }
                .padding()
            }
        }
        .navigationTitle("Event Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
