import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding: Bool = false
    @State private var currentPage = 0
    
    let pages: [(image: String, title: String, description: String)] = [
        ("onboarding1", "Discover Events", "Find exciting events happening around you"),
        ("onboarding2", "Easy Booking", "Book tickets with just a few taps"),
        ("onboarding3", "Stay Updated", "Get notifications for your favorite events")
    ]
    
    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                ForEach(0..<pages.count) { index in
                    VStack {
                        Image(pages[index].image)
                            .resizable()
                            .scaledToFit()
                            .padding()
                        
                        Text(pages[index].title)
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
                        Text(pages[index].description)
                            .font(.body)
                            .multilineTextAlignment(.center)
                            .padding()
                    }
                    .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            
            Button(action: {
                if currentPage < pages.count - 1 {
                    withAnimation {
                        currentPage += 1
                    }
                } else {
                    hasCompletedOnboarding = true
                }
            }) {
                Text(currentPage < pages.count - 1 ? "Next" : "Get Started")
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.highlightBrand)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
        }
        .background(Color.primaryBrand.ignoresSafeArea())
    }
}
