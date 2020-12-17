//
//  LoginDependencyItem.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/14.
//

import Foundation
import Dependencies
import HacomaDIContainer

public struct LoginDependencyItem: Dependency, LoginDependency {
    
    public init() {
        // available outside of the framework
    }
    
    public var viewController: UIViewController {
        return LoginViewController(nibName: LoginViewController.className, bundle: LoginViewController.bundle)
    }
}
