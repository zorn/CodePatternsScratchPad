//
//  StoryboardInfo.swift
//  CodePatternsDemo
//
//  Created by Michael Zornek on 5/11/16.
//  Copyright © 2016 Clickable Bliss. All rights reserved.
//

import UIKit

enum StoryboardInfo: String {
    
    case Login = "Login"
    case Profile = "Main"
    case Signup = "Signup"
    
    static func storyboard(item: StoryboardInfo) -> UIStoryboard {
        return UIStoryboard(name: item.rawValue, bundle: nil)
    }
    
}

struct AppNameStoryboards {
    
    static func logInStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "LogIn", bundle: nil)
    }
    
}

// LoginViewController.swift
private struct Segue {
    static let PINSetup = "showPinSetup"
    static let RetrieveUsername = "showRetrieveUsername"
    static let ResetPassword = "showResetPassword"
    static let ResendActivationLink = "showResendActivationLink"
}
