import SwiftUI

struct LoginView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var email = ""
    @State private var password = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""

    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryBrand.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    TextField("Email", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    CustomButton(title: "Log In") {
                        login()
                    }
                    
                    Button("Forgot Password?") {
                        // Implement forgot password functionality
                    }
                    .foregroundColor(.gray)
                }
                .padding()
            }
            .navigationTitle("Log In")
            .alert(isPresented: $showingAlert) {
                Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
    
    private func login() {
        guard !email.isEmpty && !password.isEmpty else {
            alertMessage = "Please enter both email and password"
            showingAlert = true
            return
        }
        
        // Implement actual login logic here
        userViewModel.login(email: email, password: password) { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            } else {
                alertMessage = "Invalid email or password"
                showingAlert = true
            }
        }
    }
}
