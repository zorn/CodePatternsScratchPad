import UIKit

class ColorPreviewCell : UITableViewCell {
    @IBOutlet var colorTextLabel: UILabel!
    @IBOutlet var colorPreviewView: UIView!
}

extension ColorPreviewCell: NibLoadable {
    static var nibName: String { return "ColorPreviewCell" }
}