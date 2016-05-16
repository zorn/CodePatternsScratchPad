import UIKit

protocol NibLoadable: class {
    static var nibName: String { get }
    static var nib: UINib { get }
    
    func createView<View: UIView where View: NibLoadable>(ofType _: View.Type) -> View
}

extension NibLoadable {
    
    static var nib: UINib {
        return UINib(nibName: nibName, bundle: NSBundle(forClass: self))
    }
    
    // Useful for custom view designed in xibs, eg: table header view, section headers, etc.
    static func createView<View: UIView where View: NibLoadable>(ofType _: View.Type) -> View {
        let nib = View.nib
        let nibContents = nib.instantiateWithOwner(nil, options: nil)
        assert(nibContents.count == 1, "\(nib) should hold only a single view, but found \(nibContents.count) items: \(nibContents)")
        return nibContents.first as! View
    }
}
