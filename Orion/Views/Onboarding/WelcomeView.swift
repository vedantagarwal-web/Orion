import SwiftUI

struct WelcomeView: View {
    @State private var showingSignUp = false
    @State private var showingLogin = false
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.primaryBrand, Color.highlightBrand]), startPoint: .top, endPoint: .bottom)
                .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 30) {
                Image("orion-logo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                
                Text("Welcome to Orion")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .padding()
                
                VStack(spacing: 20) {
                    CustomButton(title: "Sign Up") {
                        showingSignUp = true
                    }
                    
                    CustomButton(title: "Log In") {
                        showingLogin = true
                    }
                    .background(Color.white.opacity(0.1))
                }
                .padding(.horizontal, 40)
            }
        }
        .sheet(isPresented: $showingSignUp) {
            SignUpView()
        }
        .sheet(isPresented: $showingLogin) {
            LoginView()
        }
    }
}
