import UIKit

struct MenuItem {
    let title: String
    let details: String?
    let runAction: ((navigation: UINavigationController) -> ())?
}

struct MenuSection {
    let title: String
    let items: [MenuItem]
}

struct Menu {
    let title: String
    let sections: [MenuSection]
    
    static func registerMenuCellsForTableView(tableView: UITableView) {
        tableView.registerClass(MenuTitleCell.self, forCellReuseIdentifier: MenuTitleCell.reuseIdentifier)
        tableView.registerClass(MenuTitleWithDetailsCell.self, forCellReuseIdentifier: MenuTitleWithDetailsCell.reuseIdentifier)
    }
}
