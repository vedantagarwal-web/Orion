import SwiftUI

struct SignUpView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var showingAlert = false
    @State private var alertMessage = ""
    @State private var isLoading = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryBrand.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 20) {
                        Image("orion-logo") // Assuming you have a logo image
                            .resizable()
                            .scaledToFit()
                            .frame(height: 100)
                            .padding(.top, 50)
                        
                        Text("Create Your Account")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        
                        VStack(spacing: 15) {
                            TextField("Full Name", text: $name)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.words)
                            
                            TextField("Email", text: $email)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                            
                            SecureField("Password", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            SecureField("Confirm Password", text: $confirmPassword)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                        }
                        .padding(.horizontal)
                        
                        CustomButton(title: "Sign Up") {
                            signUp()
                        }
                        .padding(.horizontal)
                        .disabled(isLoading)
                        
                        if isLoading {
                            ProgressView()
                                .progressViewStyle(CircularProgressViewStyle(tint: .white))
                                .scaleEffect(1.5)
                        }
                        
                        Spacer()
                        
                        HStack {
                            Text("Already have an account?")
                                .foregroundColor(.gray)
                            Button("Log In") {
                                presentationMode.wrappedValue.dismiss()
                            }
                            .foregroundColor(.highlightBrand)
                        }
                        .padding(.bottom)
                    }
                }
            }
            .navigationBarHidden(true)
        }
        .alert(isPresented: $showingAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func signUp() {
        guard !name.isEmpty else {
            alertMessage = "Please enter your name"
            showingAlert = true
            return
        }
        
        guard !email.isEmpty, email.contains("@") else {
            alertMessage = "Please enter a valid email address"
            showingAlert = true
            return
        }
        
        guard password.count >= 8 else {
            alertMessage = "Password must be at least 8 characters long"
            showingAlert = true
            return
        }
        
        guard password == confirmPassword else {
            alertMessage = "Passwords do not match"
            showingAlert = true
            return
        }
        
        isLoading = true
        
        userViewModel.signup(name: name, email: email, password: password) { success in
            isLoading = false
            if success {
                presentationMode.wrappedValue.dismiss()
            } else {
                alertMessage = "Failed to create account. Please try again."
                showingAlert = true
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
            .environmentObject(UserViewModel())
    }
}
