import UIKit

extension UIImage {
    
    enum AssetIdentifier: String {
        // generic icons
        case Location = "icon-location-small-gray"
        case Phone = "icon-phone"
        case Star = "icon-fav-location-off"
        case StarOn = "icon-fav-location-on"
        case StarGrey = "icon-fav-location-small-gray"
        case Time = "icon-time"
        case ChevronDown = "icon-chevron-down"
        case Error = "icon-error"
    }
    
    convenience init!(_ assetIdentifier: AssetIdentifier) {
        self.init(named: assetIdentifier.rawValue)
    }

}

let icon = UIImage(.Star)

private func sampleCode() {
    
    let icon = UIImage(.Star)
    
}