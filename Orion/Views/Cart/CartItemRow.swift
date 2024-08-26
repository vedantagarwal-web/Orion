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
                Text("\(CurrencyFormatter.formatPrice(item.event.price)) each")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(CurrencyFormatter.formatPrice(item.event.price * Double(item.quantity)))
                .font(.headline)
                .foregroundColor(.accentBrand)
        }
    }
}
