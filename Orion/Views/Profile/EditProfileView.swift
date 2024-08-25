//
//  EditProfileView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/25/24.
//

import Foundation
import SwiftUI

struct EditProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Profile Picture")) {
                    Button(action: {
                        showingImagePicker = true
                    }) {
                        HStack {
                            Text("Change Profile Picture")
                            Spacer()
                            Image(systemName: "camera")
                        }
                    }
                }
                
                Section(header: Text("Personal Information")) {
                    TextField("Name", text: $name)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .disableAutocorrection(true)
                        .keyboardType(.emailAddress)
                }
            }
            .navigationTitle("Edit Profile")
            .navigationBarItems(trailing: Button("Save") {
                saveProfile()
            })
        }
        .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
            ImagePicker(image: $inputImage)
        }
        .onAppear {
            name = userViewModel.currentUser?.name ?? ""
            email = userViewModel.currentUser?.email ?? ""
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        // Here you would typically upload the image to your server
        // and get back a URL to store in the user's profile
        // For this example, we'll just simulate this process
        let imageUrl = "https://example.com/profile_images/newimage.jpg"
        userViewModel.updateProfileImage(url: imageUrl)
    }
    
    func saveProfile() {
        userViewModel.updateProfile(name: name, email: email)
        presentationMode.wrappedValue.dismiss()
    }
}
