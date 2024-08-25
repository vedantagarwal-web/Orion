import Foundation
import Combine

class UserViewModel: ObservableObject {
    @Published var currentUser: User?
    @Published var isLoggedIn: Bool = false
    @Published var favoriteEvents: [Event] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    func login(email: String, password: String, completion: @escaping (Bool) -> Void) {
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // In a real app, validate credentials against a server
            if email == "user@example.com" && password == "password" {
                self.currentUser = User(id: UUID(), name: "John Doe", email: email)
                self.isLoggedIn = true
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    func logout() {
        currentUser = nil
        isLoggedIn = false
        favoriteEvents = []
    }
    
    func signup(name: String, email: String, password: String, completion: @escaping (Bool) -> Void) {
        // Simulate network request
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // In a real app, send user data to a server
            self.currentUser = User(id: UUID(), name: name, email: email)
            self.isLoggedIn = true
            completion(true)
        }
    }
    
    func updateProfile(name: String, email: String) {
        guard var user = currentUser else { return }
        user.name = name
        user.email = email
        currentUser = user
        // In a real app, send updated profile to a server
    }
    
    func updateProfileImage(url: String) {
        guard var user = currentUser else { return }
        user.profileImageUrl = url
        currentUser = user
        // In a real app, send updated profile to a server
    }
    
    func toggleFavorite(_ event: Event) {
        if let index = favoriteEvents.firstIndex(where: { $0.id == event.id }) {
            favoriteEvents.remove(at: index)
        } else {
            favoriteEvents.append(event)
        }
        // In a real app, sync favorites with a server
    }
    
    func isFavorite(_ event: Event) -> Bool {
        favoriteEvents.contains(where: { $0.id == event.id })
    }
}
