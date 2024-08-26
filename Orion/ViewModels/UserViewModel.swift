import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isLoggedIn: Bool = false
    @Published private var favoriteEventIds: Set<UUID> = []
    
    private let userDefaultsKey = "CurrentUser"
    private let favoriteEventsKey = "FavoriteEvents"
    
    init() {
        loadUser()
        loadFavoriteEvents()
    }
    
    // MARK: - Authentication
    
    func login(email: String, password: String) -> Bool {
        // For demo purposes, we'll use a simple check
        if email == "demo@example.com" && password == "password" {
            let user = User(id: UUID(), name: "Demo User", email: email, profileImageUrl: nil)
            self.currentUser = user
            self.isLoggedIn = true
            saveUser()
            return true
        }
        return false
    }
    
    func signup(name: String, email: String, password: String) -> Bool {
        // In a real app, you'd check if the email is already in use
        let user = User(id: UUID(), name: name, email: email, profileImageUrl: nil)
        self.currentUser = user
        self.isLoggedIn = true
        saveUser()
        return true
    }
    
    func logout() {
        self.currentUser = nil
        self.isLoggedIn = false
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
        // Clear favorite events when logging out
        self.favoriteEventIds.removeAll()
        saveFavoriteEvents()
    }
    
    // MARK: - Profile Management
    
    func updateProfile(name: String, email: String) {
        guard var user = currentUser else { return }
        user.name = name
        user.email = email
        self.currentUser = user
        saveUser()
    }
    
    func updatePassword(currentPassword: String, newPassword: String) -> Bool {
        // For demo purposes, we'll just check if the current password is correct
        if currentPassword == "password" {
            // In a real app, you'd hash the new password and save it
            print("Password updated successfully")
            return true
        }
        return false
    }
    
    func updateProfileImage(url: String) {
        guard var user = currentUser else { return }
        user.profileImageUrl = url
        self.currentUser = user
        saveUser()
    }
    
    // MARK: - Favorite Events
    
    func toggleFavorite(_ event: Event) {
        if favoriteEventIds.contains(event.id) {
            favoriteEventIds.remove(event.id)
        } else {
            favoriteEventIds.insert(event.id)
        }
        saveFavoriteEvents()
    }
    
    func isFavorite(_ event: Event) -> Bool {
        favoriteEventIds.contains(event.id)
    }
    
    func getFavoriteEvents() -> [Event] {
        // This is a placeholder. In a real app, you'd fetch the actual events from a data source
        return Event.sampleEvents.filter { favoriteEventIds.contains($0.id) }
    }
    
    // MARK: - Data Persistence
    
    private func saveUser() {
        if let encoded = try? JSONEncoder().encode(currentUser) {
            UserDefaults.standard.set(encoded, forKey: userDefaultsKey)
        }
    }
    
    private func loadUser() {
        if let userData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let user = try? JSONDecoder().decode(User.self, from: userData) {
            self.currentUser = user
            self.isLoggedIn = true
        }
    }
    
    private func saveFavoriteEvents() {
        UserDefaults.standard.set(Array(favoriteEventIds), forKey: favoriteEventsKey)
    }
    
    private func loadFavoriteEvents() {
        if let favoriteIds = UserDefaults.standard.array(forKey: favoriteEventsKey) as? [UUID] {
            self.favoriteEventIds = Set(favoriteIds)
        }
    }
}

// MARK: - Sample Data
extension Event {
    static let sampleEvents = [
        Event(id: UUID(), title: "Summer Music Festival", date: Date().addingTimeInterval(86400 * 30), venue: "Central Park", location: "New York", description: "Annual summer music festival featuring top artists", price: 99.99, image: "music.note.list", category: "Music"),
        Event(id: UUID(), title: "Tech Conference 2023", date: Date().addingTimeInterval(86400 * 60), venue: "Convention Center", location: "San Francisco", description: "Explore the latest in technology", price: 199.99, image: "desktopcomputer", category: "Technology"),
        Event(id: UUID(), title: "Food & Wine Expo", date: Date().addingTimeInterval(86400 * 15), venue: "City Hall", location: "Chicago", description: "Taste the best food and wine from around the world", price: 79.99, image: "fork.knife", category: "Food")
    ]
}
