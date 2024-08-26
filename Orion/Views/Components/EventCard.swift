import SwiftUI


struct EventCard: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 150)
                .clipped()
                .cornerRadius(10)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .font(.headline)
                    .lineLimit(1)
                    .foregroundColor(.white)
                
                Text(event.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(event.venue)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(CurrencyFormatter.formatPrice(event.price))
                    .font(.subheadline)
                    .foregroundColor(.accentBrand)
            }
        }
        .frame(width: 250)
        .padding(10)
        .background(Color.secondaryBrand)
        .cornerRadius(15)
        .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: 2)
    }
}
