import UIKit

class Store : NSObject {}

class StoreDetailsController: UITableViewController {
    
    private enum CellType: String {
        case Map        = "MapCell"
        case Title      = "TitleCell"
        case Address    = "AddressCell"
        case Phone      = "PhoneCell"
        case StoreHours = "StoreHoursCell"
    }
    
    private var cells: [CellType] = []
    private var store: Store!
    
    func configure(store: Store) {
        self.store = store
        
        cells = [.Map, .Title, .Address]
        if store.locationPhone != nil {
            cells.append(.Phone)
        }
        if store.storeHours != nil {
            cells.append(.StoreHours)
        }
    }
    
override func tableView(tableView: UITableView,
                        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
    let cellType = cells[indexPath.row]
    let reuseIdentifier = cellType.rawValue
    let cell = tableView.dequeueReusableCellWithIdentifier(reuseIdentifier, forIndexPath: indexPath)
    
    switch cellType {
    case .Map:
        print("custom config")
    case .Title:
        print("custom config")
    case .Address:
        print("custom config")
    case .Phone:
        print("custom config")
    case .StoreHours:
        print("custom config")
    }
    
    return cell
}
    
    private func handleSetCenterFavoriteStatusResult(result: Result<(), ErrorType>) {
        if let error = result.error {
            // Log out the detailed (programmer) error, and display something more user-friendly.
            NSLog("Could not set retail center favorite status: \(error)")
            
            let alert = UIAlertController(forInformingOfError: error)
            presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    private lazy var favoriteBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(.StarOn), style: UIBarButtonItemStyle.Plain, target: self, action: "favoriteButtonPressed:")
    }()
    
    private lazy var unfavoriteBarButtonItem: UIBarButtonItem = {
        return UIBarButtonItem(image: UIImage(.Star), style: UIBarButtonItemStyle.Plain, target: self, action: "favoriteButtonPressed:")
    }()
    
    private lazy var activityIndicatorBarButtonItem: UIBarButtonItem = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.sizeToFit()
        Themer.themeActivityIndicatorInNavigationbar(activityIndicator)
        activityIndicator.startAnimating()
        return UIBarButtonItem(customView: activityIndicator)
    }()
    
    func favoriteButtonPressed(sender: UIButton) {
        switch favoriteState {
        case .Unavailable, .BeingSynchronized:
            fatalError("Favorite button should not be pressable if favorites are not available")
            
        case let .Available(isFavorite: isFavorite, handleChange: handler):
            let oldFavoriteState = favoriteState
            favoriteState = .BeingSynchronized
            handler(!isFavorite).uponMainQueue { [weak self] result in
                switch result {
                case .Success:
                    // keep the same handler, but toggle our isFavorite-ness
                    self?.favoriteState = .Available(isFavorite: !isFavorite, handleChange: handler)
                    
                case .Failure:
                    self?.favoriteState = oldFavoriteState
                }
            }
        }
    }
    
    enum FavoriteState {
        case Unavailable
        case BeingSynchronized
        case Available(isFavorite: Bool, handleChange: (Bool) -> Task<Void>)
    }
    
    var favoriteState = FavoriteState.Unavailable {
        didSet {
            switch favoriteState {
            case .Unavailable:
                navigationItem.rightBarButtonItem = nil
                
            case .BeingSynchronized:
                navigationItem.rightBarButtonItem = activityIndicatorBarButtonItem
                
            case let .Available(isFavorite: isFavorite, handleChange: _):
                if isFavorite {
                    navigationItem.rightBarButtonItem = favoriteBarButtonItem
                } else {
                    navigationItem.rightBarButtonItem = unfavoriteBarButtonItem
                }
            }
        }
    }
    
}

enum UserProfileSections {
    case UsageDataSection
    case ContactInfoSection
    
    static let count = 2
}

enum UsageDataRows {
    case NumberOfTweetsRow
    case NumberOfFollowersRow
    
    static let count = 2
}

enum ContactInfoRows {
    case EmailRow
    case PhoneRow
    case PostalRow
    
    static let count = 3
}












