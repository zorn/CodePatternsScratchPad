import UIKit

class CustomCell : UITableViewCell { }

extension UITableView {
    
    func dequeue<V: UITableViewCell>(cellOfType type: V.Type,
                 indexPath: NSIndexPath, reuseIdentifier: String? = nil) -> V {
        let identifier = reuseIdentifier ?? NSStringFromClass(type)
        return dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as! V
    }
    
}

private func sampleCode() {
    
    let tableView = UITableView()
    let indexPath = NSIndexPath()
    
    let cell = tableView.dequeueReusableCellWithIdentifier("CustomCell", forIndexPath: indexPath) as! CustomCell
    let cell = tableView.dequeue(cellOfType: CustomCell.self, indexPath: indexPath)
    
}