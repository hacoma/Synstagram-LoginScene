//
//  UIHelper.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/11.
//

import UIKit

class UIHelper {
    
    static func getFont(name: String, size: CGFloat) -> UIFont {
        return UIFont.safeFont(name: name, size: size)
    }
    
    static func getImage(name: String) -> UIImage? {
        return UIImage(named: name, in: Bundle(for: self), compatibleWith: nil)
    }
}
