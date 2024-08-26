import SwiftUI

struct ReviewFormView: View {
    @EnvironmentObject var userViewModel: UserViewModel
    @Environment(\.presentationMode) var presentationMode
    @Binding var event: Event
    
    @State private var rating: Int = 0
    @State private var comment: String = ""
    @State private var isSubmitting = false
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Rate your experience")) {
                    HStack {
                        ForEach(1...5, id: \.self) { star in
                            Image(systemName: star <= rating ? "star.fill" : "star")
                                .foregroundColor(star <= rating ? .yellow : .gray)
                                .onTapGesture {
                                    rating = star
                                }
                        }
                    }
                }
                
                Section(header: Text("Write your review")) {
                    TextEditor(text: $comment)
                        .frame(height: 200)
                }
                
                Section {
                    Button(action: submitReview) {
                        if isSubmitting {
                            ProgressView()
                        } else {
                            Text("Submit Review")
                        }
                    }
                    .disabled(rating == 0 || comment.isEmpty || isSubmitting)
                }
            }
            .navigationTitle("Write a Review")
            .navigationBarItems(trailing: Button("Cancel") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    
    private func submitReview() {
        isSubmitting = true
        
        let review = Review(
            userID: userViewModel.currentUser?.id ?? UUID(),
            userName: userViewModel.currentUser?.name ?? "Anonymous",
            rating: rating,
            comment: comment
        )
        
        // In a real app, you would send this review to your backend
        // For now, we'll just simulate an API call with a delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            // Update the event with the new review
            var updatedEvent = self.event
            updatedEvent.reviews.append(review)
            self.event = updatedEvent
            
            // In a real app, you would update this in your database
            // For now, we'll just print it
            print("New review submitted for event: \(event.title)")
            print("Rating: \(rating), Comment: \(comment)")
            
            isSubmitting = false
            presentationMode.wrappedValue.dismiss()
        }
    }
}
