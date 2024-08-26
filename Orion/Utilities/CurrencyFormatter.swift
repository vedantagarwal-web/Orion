import Foundation

struct CurrencyFormatter {
    static func formatPrice(_ price: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.currencyCode = "MYR"
        formatter.currencySymbol = "RM"
        formatter.locale = Locale(identifier: "ms_MY")
        return formatter.string(from: NSNumber(value: price)) ?? "RM \(price)"
    }
}
