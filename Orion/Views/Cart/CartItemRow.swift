import SwiftUI

struct CartItemRow: View {
    @EnvironmentObject var cartViewModel: CartViewModel
    let item: CartItem
    
    var body: some View {
        HStack {
            Image(item.event.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(RoundedRectangle(cornerRadius: 10))
            
            VStack(alignment: .leading, spacing: 5) {
                Text(item.event.title)
                    .font(.headline)
                
                Text("$\(item.event.price, specifier: "%.2f")")
                    .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                VStack {
                                    Text("Qty: \(item.quantity)")
                                        .font(.subheadline)
                                    
                                    Stepper("", value: Binding(
                                        get: { item.quantity },
                                        set: { cartViewModel.updateQuantity(for: item, quantity: $0) }
                                    ), in: 1...10)
                                    .labelsHidden()
                                }
                            }
                            .padding(.vertical, 8)
                        }
                    }
