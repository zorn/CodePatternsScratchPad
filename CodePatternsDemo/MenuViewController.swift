import UIKit

class MenuViewController: UITableViewController {
    
    private var menu = Menu(title: "Default Menu", sections: [])
    
    init(menu: Menu) {
        self.menu = menu
        super.init(style: UITableViewStyle.Grouped)
        Menu.registerMenuCellsForTableView(tableView)
        self.title = menu.title
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK: - UITableViewDataSource

extension MenuViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return menu.sections.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let currentSection = menu.sections[section]
        return currentSection.items.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let currentItem = currentItemForIndexPath(indexPath)
        let cell: UITableViewCell
        if currentItem.details != nil {
            cell = tableView.dequeueReusableCellWithIdentifier(MenuTitleWithDetailsCell.reuseIdentifier, forIndexPath: indexPath)
            cell.textLabel!.text = currentItem.title
            cell.detailTextLabel!.text = currentItem.details
        } else {
            cell = tableView.dequeueReusableCellWithIdentifier(MenuTitleCell.reuseIdentifier, forIndexPath: indexPath)
            cell.textLabel!.text = currentItem.title
        }
        return cell;
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let currentItem = currentItemForIndexPath(indexPath)
        if let action = currentItem.runAction {
            action(navigation: self.navigationController!)
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    private func currentItemForIndexPath(indexPath: NSIndexPath) -> MenuItem {
        let currentSection = menu.sections[indexPath.section]
        let currentItem = currentSection.items[indexPath.row]
        return currentItem
    }
    
}
