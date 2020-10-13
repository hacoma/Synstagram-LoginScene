//
//  Module.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/12.
//

import UIKit

public final class Module {
    
    private let dependencies: Dependencies
    
    public var controller: UIViewController {
        let vc = LoginViewController(nibName: LoginViewController.className, bundle: LoginViewController.bundle)
        vc.dependencies = dependencies
        return vc
    }
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
}
