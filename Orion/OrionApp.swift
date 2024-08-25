import SwiftUI

@main
struct OrionApp: App {
    @StateObject private var userViewModel = UserViewModel()
    @StateObject private var cartViewModel = CartViewModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(userViewModel)
                .environmentObject(cartViewModel)
        }
    }
}
