//
//  Module.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/12.
//

public final class Module {
    
    private let dependencies: Dependencies
    
    public init(dependencies: Dependencies) {
        self.dependencies = dependencies
    }
    
    public func load(to window: inout UIWindow?) {
        let vc = LoginViewController(nibName: LoginViewController.className, bundle: LoginViewController.bundle)
        vc.dependencies = dependencies
        window?.rootViewController = vc
    }
    
    public func load(to navigationController: UINavigationController) {
        let vc = LoginViewController(nibName: LoginViewController.className, bundle: LoginViewController.bundle)
        vc.dependencies = dependencies
        navigationController.pushViewController(vc, animated: true)
    }
}
