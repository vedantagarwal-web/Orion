import SwiftUI


struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack(spacing: 15) {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(event.title)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(event.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                
                Text(event.venue)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(CurrencyFormatter.formatPrice(event.price))
                .font(.headline)
                .foregroundColor(.accentBrand)
        }
        .padding(10)
        .background(Color.secondaryBrand)
        .cornerRadius(15)
    }
}
