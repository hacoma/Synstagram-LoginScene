//
//  ContentView.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/10.
//

import UIKit
import HacomaUI

class ContentView: UIView {
    
    @IBOutlet private weak var usernameView: UsernameView!
    @IBOutlet private weak var passwordView: PasswordView!
    @IBOutlet private weak var loginButton: UIButton!
    @IBOutlet private weak var rememberSwitch: UISwitch!
    
    weak var interactor: LoginBusinessLogic?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    deinit {
        removeKeyboardObserver()
    }
    
    private func initialize() {
        loadFromNib()
        configureView()
        addKeyboardObserver()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        endEditing(true)
    }
    
    func transitionFailedLogin() {
        loginButton.isEnabled = true
    }
}

extension ContentView {
    
    private func configureView() {
        configureUsernameView()
        configurePasswordView()
        configureLoginButton()
    }
    
    private func configureUsernameView() {
        usernameView.textDidChange = { [weak self] in
            self?.textFieldDidChange()
        }
    }
    
    private func configurePasswordView() {
        passwordView.textDidChange = { [weak self] in
            self?.textFieldDidChange()
        }
    }
    
    private func configureLoginButton() {
        loginButton.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        loginButton.setTitleColor(#colorLiteral(red: 0.6666666667, green: 0.6666666667, blue: 0.6666666667, alpha: 1), for: .disabled)
    }
}

extension ContentView {
    
    private func textFieldDidChange() {
        guard
            let username = usernameView.text,
            let password = passwordView.text
        else { return }
        
        let canTryLogin = !username.isEmpty && !password.isEmpty
        
        loginButton.isEnabled = canTryLogin
        loginButton.backgroundColor = canTryLogin ? #colorLiteral(red: 0, green: 0.537254902, blue: 0.9529411765, alpha: 1) : #colorLiteral(red: 0, green: 0.2549019608, blue: 0.4392156863, alpha: 1)
    }
}

extension ContentView {
    
    @IBAction private func touchedLoginButton(_ sender: Any) {
        guard
            let username = usernameView.text,
            let password = passwordView.text
        else { return }
        
        loginButton.isEnabled = false
        
        let request = LoginModel.Request(username: username, password: password, isRemember: rememberSwitch.isOn)
        interactor?.requestLogin(request: request)
    }
}

extension ContentView {
    
    private func addKeyboardObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillShow),
                                               name: UIWindow.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(keyboardWillHide),
                                               name: UIWindow.keyboardWillHideNotification,
                                               object: nil)
    }
    
    private func removeKeyboardObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}

extension ContentView {
    
    @objc private func keyboardWillShow() {
        // TODO: update autolayout constraint for keyboard will show
    }
    
    @objc private func keyboardWillHide(){
        // TODO: update autolayout constraint for keyboard will hide
    }
}

extension ContentView {
    
    private func updateLayout() {
        // TODO: update autolayout constraint for screen size
    }
}
