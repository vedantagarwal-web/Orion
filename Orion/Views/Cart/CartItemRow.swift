import SwiftUI

struct CartItemRow: View {
    let item: CartItem
    
    var body: some View {
        HStack {
            Image(item.event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.event.title)
                    .font(.headline)
                Text("$\(item.event.price, specifier: "%.2f") each")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text("$\(item.event.price * Double(item.quantity), specifier: "%.2f")")
                .font(.headline)
                .foregroundColor(.accentBrand)
        }
    }
}
