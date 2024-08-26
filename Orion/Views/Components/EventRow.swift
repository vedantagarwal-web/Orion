import SwiftUI

struct EventRow: View {
    let event: Event
    
    var body: some View {
        HStack {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipped()
                .cornerRadius(5)
            
            VStack(alignment: .leading) {
                Text(event.title)
                    .font(.headline)
                Text(event.date, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            
            Spacer()
            
            Text("$\(event.price, specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.accentBrand)
        }
        .padding(.horizontal)
    }
}
