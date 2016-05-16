import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let menuVC = MenuViewController(menu: Menu.appMemu())
        let navigation = UINavigationController(rootViewController: menuVC)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible()
        
        return true
    }

}
