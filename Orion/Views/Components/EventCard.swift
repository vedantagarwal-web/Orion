import SwiftUI

struct EventCard: View {
    let event: Event
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 250, height: 150)
                .clipped()
                .cornerRadius(10)
            
            Text(event.title)
                .font(.headline)
                .lineLimit(1)
            
            Text(event.date, style: .date)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .frame(width: 250)
    }
}
