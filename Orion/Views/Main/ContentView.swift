import SwiftUI

struct ContentView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        Group {
            if userViewModel.isLoggedIn {
                MainTabView()
            } else {
                WelcomeView()
            }
        }
        .preferredColorScheme(.dark)
    }
}
