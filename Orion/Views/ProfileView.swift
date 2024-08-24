//
//  ProfileView.swift
//  Orion
//
//  Created by Vedant Agarwal on 8/24/24.
//

import Foundation
// Views/ProfileView.swift
import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel

    var body: some View {
        NavigationView {
            if let user = userViewModel.currentUser {
                Form {
                    Section(header: Text("Profile Information")) {
                        HStack {
                            if let imageUrl = user.profileImageUrl, let url = URL(string: imageUrl) {
                                AsyncImage(url: url) { image in
                                    image
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 50, height: 50)
                                        .clipShape(Circle())
                                } placeholder: {
                                    Circle()
                                        .fill(Color.gray)
                                        .frame(width: 50, height: 50)
                                }
                            } else {
                                Circle()
                                    .fill(Color.gray)
                                    .frame(width: 50, height: 50)
                            }
                            
                            VStack(alignment: .leading) {
                                Text(user.name)
                                    .font(.headline)
                                Text(user.email)
                                    .font(.subheadline)
                                    .foregroundColor(.secondary)
                            }
                            .padding(.leading, 8)
                        }
                    }
                    
                    Section {
                        Button("Logout") {
                            userViewModel.logout()
                        }
                        .foregroundColor(.red)
                    }
                }
                .navigationTitle("Profile")
            } else {
                Text("Please log in to view your profile")
                    .navigationTitle("Profile")
            }
        }
    }
}
