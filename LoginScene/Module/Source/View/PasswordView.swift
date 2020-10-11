//
//  PasswordView.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/11.
//

import UIKit
import HacomaExtensions
import HacomaUI

class PasswordView: UIView, TextFieldDataSource {
    
    @IBOutlet private weak var textField: InsetTextField!
    
    var textDidChange: (() -> Void)?
    
    var text: String? {
        return textField.text
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        loadFromNib()
        configureView()
    }
    
    private func configureView() {
        configureTextField()
    }
}

extension PasswordView {
    
    private func configureTextField() {
        configureTextFieldPlaceHolder()
        configureTextFieldRightView()
        configureTextFieldAction()
    }
    
    private func configureTextFieldPlaceHolder() {
        textField.attributedPlaceholder = NSMutableAttributedString(string: "비밀번호")
            .set(font: UIHelper.getFont(name: "AppleSDGothicNeo-Bold", size: 13))
            .set(fontColor: #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1))
    }
    
    private func configureTextFieldRightView() {
        let rightViewSize = CGSize(width: 55, height: 40)
        let seeButtonSize = CGSize(width: 25, height: 25)
        
        let seeButtonX = (rightViewSize.width - seeButtonSize.width) / 2
        let seeButtonY = (rightViewSize.height - seeButtonSize.height) / 2
        let seeButtonOrigin = CGPoint(x: seeButtonX, y: seeButtonY)
        
        let seeButton = UIButton(frame: CGRect(origin: seeButtonOrigin, size: seeButtonSize))
        seeButton.tintColor = #colorLiteral(red: 0.7490196078, green: 0.7490196078, blue: 0.7490196078, alpha: 1)
        seeButton.addTarget(self, action: #selector(touchedEyeButton(_:)), for: .touchUpInside)
        
        let eyeUnCheckImage = UIHelper.getImage(name: "EyeUnCheckedImage")
        seeButton.setImage(eyeUnCheckImage, for: .normal)
        
        let eyeCheckedImage = UIHelper.getImage(name: "EyeCheckedImage")
        seeButton.setImage(eyeCheckedImage, for: .selected)
        
        let rightView = UIView(frame: CGRect(origin: .zero, size: rightViewSize))
        rightView.addSubview(seeButton)
        
        textField.rightView = rightView
        textField.rightViewMode = .always
    }
    
    private func configureTextFieldAction() {
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
}

extension PasswordView {
    
    @objc private func touchedEyeButton(_ button: UIButton) {
        button.isSelected.toggle()
        textField.isSecureTextEntry = !button.isSelected
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        textDidChange?()
    }
}
