import SwiftUI

struct ContentView: View {
    @EnvironmentObject private var userViewModel: UserViewModel
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    
    var body: some View {
        Group {
            if !hasCompletedOnboarding {
                OnboardingView()
            } else if userViewModel.isLoggedIn {
                MainTabView()
            } else {
                WelcomeView()
            }
        }
        .preferredColorScheme(.dark)
    }
}
