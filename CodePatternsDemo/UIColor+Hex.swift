import UIKit

// UIColor+Hex.swift
public extension UIColor {
    
    convenience init(hex: UInt32) {
        let red   = CGFloat((hex >> 16) & 0xff) / 255
        let green = CGFloat((hex >>  8) & 0xff) / 255
        let blue  = CGFloat((hex      ) & 0xff) / 255
        self.init(red: red, green: green, blue: blue, alpha: 1)
    }
    
}

struct DayTheme {
    static let backgroundColor = UIColor(hex: 0xfefefe)
    static let textColor = UIColor(hex: 0x121212)
    static let highlightColor = UIColor.redColor()
}

private func sampleCode() {
    
    let greetingLabel = UILabel()
    greetingLabel.textColor = DayTheme.textColor
    
}

