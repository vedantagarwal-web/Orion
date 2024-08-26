import SwiftUI

struct AccountSettingsView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var currentPassword: String = ""
    @State private var newPassword: String = ""
    @State private var confirmNewPassword: String = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        Form {
            Section(header: Text("Profile Information")) {
                if let user = userViewModel.currentUser {
                    HStack {
                        if let imageUrl = user.profileImageUrl, let url = URL(string: imageUrl) {
                            AsyncImage(url: url) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                            } placeholder: {
                                ProgressView()
                            }
                        } else {
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 100, height: 100)
                                .clipShape(Circle())
                                .foregroundColor(.gray)
                        }
                        
                        Button(action: {
                            showingImagePicker = true
                        }) {
                            Text("Change Photo")
                        }
                    }
                    
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .keyboardType(.emailAddress)
                }
            }
            
            Section(header: Text("Change Password")) {
                SecureField("Current Password", text: $currentPassword)
                SecureField("New Password", text: $newPassword)
                SecureField("Confirm New Password", text: $confirmNewPassword)
            }
            
            Section {
                Button(action: {
                    userViewModel.updateProfile(name: name, email: email)
                    if !newPassword.isEmpty && newPassword == confirmNewPassword {
                        userViewModel.updatePassword(currentPassword: currentPassword, newPassword: newPassword)
                    }
                }) {
                    Text("Save Changes")
                }
            }
            
            Section {
                Button(action: {
                    userViewModel.logout()
                }) {
                    Text("Log Out")
                        .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Account Settings")
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
        .onAppear {
            if let user = userViewModel.currentUser {
                name = user.name
                email = user.email
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        let imageUrl = "https://example.com/profile_images/newimage.jpg"
        userViewModel.updateProfileImage(url: imageUrl)
    }
}
