import Foundation

struct User: Identifiable, Codable {
    let id: UUID
    var name: String
    var email: String
    var profileImageUrl: String?
    
    init(id: UUID = UUID(), name: String, email: String, profileImageUrl: String? = nil) {
        self.id = id
        self.name = name
        self.email = email
        self.profileImageUrl = profileImageUrl
    }
}
