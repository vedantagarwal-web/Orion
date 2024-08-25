import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @State private var showingEditProfile = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.primaryBrand.edgesIgnoringSafeArea(.all)
                
                ScrollView {
                    VStack(spacing: 20) {
                        ProfileHeader(user: userViewModel.currentUser)
                        
                        NavigationLink(destination: FavoriteEventsView()) {
                            ProfileMenuItem(title: "Favorite Events", icon: "heart.fill")
                        }
                        
                        NavigationLink(destination: PurchaseHistoryView()) {
                            ProfileMenuItem(title: "Purchase History", icon: "bag.fill")
                        }
                        
                        NavigationLink(destination: NotificationSettingsView()) {
                            ProfileMenuItem(title: "Notification Settings", icon: "bell.fill")
                        }
                        
                        Button(action: {
                            userViewModel.logout()
                        }) {
                            ProfileMenuItem(title: "Log Out", icon: "arrow.right.square.fill")
                        }
                    }
                    .padding()
                }
            }
            .navigationTitle("Profile")
            .navigationBarItems(trailing: Button("Edit") {
                showingEditProfile = true
            })
            .sheet(isPresented: $showingEditProfile) {
                EditProfileView()
            }
        }
    }
}

struct ProfileHeader: View {
    let user: User?
    
    var body: some View {
        VStack(spacing: 10) {
            if let imageUrl = user?.profileImageUrl, let url = URL(string: imageUrl) {
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                } placeholder: {
                    ProgressView()
                }
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .foregroundColor(.gray)
            }
            
            Text(user?.name ?? "Guest")
                .font(.title2)
                .fontWeight(.bold)
            
            Text(user?.email ?? "")
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}

struct ProfileMenuItem: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.highlightBrand)
                .frame(width: 30)
            
            Text(title)
                .foregroundColor(.white)
            
            Spacer()
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.secondaryBrand)
        .cornerRadius(10)
    }
}
