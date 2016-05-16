import UIKit

extension Menu {
    static func appMemu() -> Menu {
        
        let uiColorDemo = MenuItem(title: "UIColor", details: "Building colors from hex values" , runAction: { (navigation) in
            let storyboard = UIStoryboard(name: "UIColorDemo", bundle: nil)
            let vc = storyboard.instantiateViewControllerWithIdentifier("UIColorDemoViewController") as! UIColorDemoViewController
            navigation.pushViewController(vc, animated: true)
        })
        
        
        let demos = MenuSection(title: "Demos", items: [uiColorDemo]);
        let menu = Menu(title: "Menu", sections: [demos])
        return menu
    }
}
