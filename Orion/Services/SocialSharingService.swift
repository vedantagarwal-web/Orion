import UIKit

class SocialSharingService {
    static func shareEvent(_ event: Event, from viewController: UIViewController) {
        let text = "Check out this event: \(event.title) on \(event.date)"
        let image = UIImage(named: event.image)
        
        let activityViewController = UIActivityViewController(activityItems: [text, image as Any], applicationActivities: nil)
        viewController.present(activityViewController, animated: true, completion: nil)
    }
}
