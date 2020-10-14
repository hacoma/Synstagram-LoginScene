//
//  LoginInjectItem.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/14.
//

import Foundation
import HacomaDIContainer
import Injectable

public struct LoginInjectItem: Dependency, LoginInjectable {
    
    public init() {
        // available outside of the framework
    }
    
    public var viewController: UIViewController {
        return LoginViewController(nibName: LoginViewController.className, bundle: LoginViewController.bundle)
    }
}
