import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                        .foregroundColor(.accentBrand)
                    
                    Text(userViewModel.currentUser?.name ?? "User Name")
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text(userViewModel.currentUser?.email ?? "user@example.com")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                    VStack(spacing: 15) {
                        NavigationLink(destination: Text("My Tickets")) {
                            ProfileRowView(title: "My Tickets", icon: "ticket")
                        }
                        
                        NavigationLink(destination: Text("Favorite Events")) {
                            ProfileRowView(title: "Favorite Events", icon: "heart")
                        }
                        
                        NavigationLink(destination: Text("Settings")) {
                            ProfileRowView(title: "Settings", icon: "gear")
                        }
                    }
                    .padding()
                    .background(Color.secondaryBrand)
                    .cornerRadius(10)
                    
                    Button(action: {
                        userViewModel.logout()
                    }) {
                        Text("Log Out")
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.accentBrand)
                            .cornerRadius(10)
                    }
                    .padding(.top)
                }
                .padding()
            }
            .background(Color.primaryBrand.edgesIgnoringSafeArea(.all))
            .navigationTitle("Profile")
        }
    }
}

struct ProfileRowView: View {
    let title: String
    let icon: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.accentBrand)
            Text(title)
                .foregroundColor(.white)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
        }
    }
}
