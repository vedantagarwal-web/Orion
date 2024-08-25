import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var email: String
    var profileImageUrl: String?
    var favoriteEvents: [UUID]
    
    init(id: UUID = UUID(), name: String, email: String, profileImageUrl: String? = nil, favoriteEvents: [UUID] = []) {
        self.id = id
        self.name = name
        self.email = email
        self.profileImageUrl = profileImageUrl
        self.favoriteEvents = favoriteEvents
    }
}
