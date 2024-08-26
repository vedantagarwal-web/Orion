import Foundation

struct Event: Identifiable, Codable {
    let id: UUID
    let title: String
    let date: Date
    let venue: String
    let location: String
    let description: String
    let price: Double
    let image: String
    let category: String
    var reviews: [Review]

    init(id: UUID = UUID(), title: String, date: Date, venue: String, location: String, description: String, price: Double, image: String, category: String, reviews: [Review] = []) {
        self.id = id
        self.title = title
        self.date = date
        self.venue = venue
        self.location = location
        self.description = description
        self.price = price
        self.image = image
        self.category = category
        self.reviews = reviews
    }
}

struct Review: Identifiable, Codable {
    let id: UUID
    let userID: UUID
    let userName: String
    let rating: Int
    let comment: String
    let date: Date

    init(id: UUID = UUID(), userID: UUID, userName: String, rating: Int, comment: String, date: Date = Date()) {
        self.id = id
        self.userID = userID
        self.userName = userName
        self.rating = rating
        self.comment = comment
        self.date = date
    }
}

