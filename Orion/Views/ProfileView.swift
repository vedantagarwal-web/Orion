//
//  ProfileView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
import SwiftUI
import UIKit

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    @State private var editedName: String = ""
    @State private var isEditingName = false

    var body: some View {
        NavigationView {
            if let user = userViewModel.currentUser {
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        // Profile Header
                        VStack {
                            if let inputImage = inputImage {
                                Image(uiImage: inputImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 100, height: 100)
                                    .clipShape(Circle())
                                    .shadow(radius: 10)
                            } else if let imageUrl = user.profileImageUrl, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 100, height: 100)
                                        .clipShape(Circle())
                                        .shadow(radius: 10)
                                } placeholder: {
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 100, height: 100)
                                }
                            } else {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 100, height: 100)
                            }
                            
                            Button("Change Photo") {
                                showingImagePicker = true
                            }
                            .foregroundColor(.blue)
                            .padding(.top, 10)
                            
                            if isEditingName {
                                TextField("Enter your name", text: $editedName, onCommit: {
                                    userViewModel.currentUser?.name = editedName
                                    isEditingName = false
                                })
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                                .foregroundColor(.white)
                                .padding(.top, 10)
                            } else {
                                Text(user.name)
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .onTapGesture {
                                        editedName = user.name
                                        isEditingName = true
                                    }
                            }
                            
                            Text(user.email)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.top)
                        
                        // Upcoming Events
                        Section(header: Text("Upcoming Events").font(.title2).foregroundColor(.white).padding(.horizontal)) {
                            VStack(spacing: 10) {
                                ForEach(userViewModel.upcomingEvents) { event in
                                    EventRow(event: event)
                                }
                            }
                        }
                        
                        // Past Events
                        Section(header: Text("Past Events").font(.title2).foregroundColor(.white).padding(.horizontal)) {
                            VStack(spacing: 10) {
                                ForEach(userViewModel.pastEvents) { event in
                                    EventRow(event: event)
                                }
                            }
                        }
                        
                        // Settings Section
                        Section(header: Text("Settings").font(.title2).foregroundColor(.white).padding(.horizontal)) {
                            VStack(spacing: 10) {
                                HStack {
                                    Text("Notifications")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Toggle("", isOn: $userViewModel.notificationsEnabled)
                                        .labelsHidden()
                                }
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                                
                                HStack {
                                    Text("Privacy")
                                        .foregroundColor(.white)
                                    Spacer()
                                    Button("Manage") {
                                        // Privacy settings action
                                    }
                                    .foregroundColor(.purple)
                                }
                                .padding()
                                .background(Color(UIColor.systemGray6))
                                .cornerRadius(10)
                            }
                        }
                        .padding(.bottom)
                    }
                    .padding(.horizontal)
                }
                .navigationTitle("Profile")
                .background(Color.black.edgesIgnoringSafeArea(.all))
                .actionSheet(isPresented: $showingImagePicker) {
                    ActionSheet(title: Text("Select Image Source"), buttons: [
                        .default(Text("Camera")) {
                            self.sourceType = .camera
                            self.showingImagePicker = true
                        },
                        .default(Text("Photo Library")) {
                            self.sourceType = .photoLibrary
                            self.showingImagePicker = true
                        },
                        .cancel()
                    ])
                }
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: $inputImage, sourceType: self.sourceType)
                }
            } else {
                Text("Please log in to view your profile")
                    .navigationTitle("Profile")
            }
        }
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        // In a real app, you'd upload the image to your server and get a URL in response.
        // Update the profile image in the user model.
        userViewModel.currentUser?.profileImageUrl = saveImageAndGetURL(inputImage)
    }

    func saveImageAndGetURL(_ image: UIImage) -> String {
        // Placeholder: Simulate saving the image and returning its URL.
        // Replace this with actual code to save the image and get its URL.
        return "new_image_url_after_upload"
    }
}
