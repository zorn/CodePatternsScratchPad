import UIKit

class UIColorDemoViewController : UIViewController {
    
    @IBOutlet private var tableView: UITableView!
    
//let c1 = UIColor.redColor()
//let c2 = UIColor(hue: 0.8, saturation: 0.8, brightness: 0.8, alpha: 1.0)
//let c3 = UIColor(red: 50/255, green: 25/255, blue: 32/255, alpha: 255/255)
//let c4 = UIColor(hex: 0xE6A024)
    
    
    let sampleColors = [UIColor(hex:0xffffff), UIColor(hex: 0x000000), UIColor(hex: 0xE6A024)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.registerNib(ColorPreviewCell.nib, forCellReuseIdentifier: String(ColorPreviewCell))
        tableView.allowsSelection = false
    }
}

extension UIColorDemoViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sampleColors.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(ColorPreviewCell), forIndexPath: indexPath) as! ColorPreviewCell
        cell.colorTextLabel.text = "TODO"
        let color = sampleColors[indexPath.row]
        cell.colorPreviewView.backgroundColor = color
        return cell
    }
    
}

