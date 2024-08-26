import SwiftUI

struct BookingDetailsView: View {
    let event: Event
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 20) {
                Image(event.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250)
                    .clipped()
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding(.bottom, 20)

                VStack(alignment: .leading, spacing: 10) {
                    Text(event.title)
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                    
                    Text(event.date, style: .date)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text(event.venue)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    Text("$\(event.price, specifier: "%.2f")")
                        .font(.headline)
                        .foregroundColor(.accentBrand)
                    
                    Text(event.description)
                        .font(.body)
                        .foregroundColor(.white)
                        .padding(.top, 10)
                    
                    Button(action: {
                        // Handle booking action
                    }) {
                        Text("Book Now")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.accentBrand)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 10)
                    }
                    .padding(.top, 20)
                }
                .padding()
            }
        }
        .background(Color.primaryBrand.edgesIgnoringSafeArea(.all))
        .navigationBarTitle("Event Details", displayMode: .inline)
    }
}
