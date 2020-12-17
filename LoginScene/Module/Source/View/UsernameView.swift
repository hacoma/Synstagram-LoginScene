//
//  UsernameView.swift
//  LoginScene
//
//  Created by hacoma on 2020/10/11.
//

import UIKit
import HacomaExtensions
import HacomaUI

class UsernameView: UIView, TextFieldDataSource {
    
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
}

extension UsernameView {
    
    private func configureView() {
        configureTextField()
    }
    
    private func configureTextField() {
        configureTextFieldPlaceHolder()
        configureTextFieldRightView()
        configureTextFieldAction()
    }
}

extension UsernameView {
    
    private func configureTextFieldPlaceHolder() {
        textField.attributedPlaceholder = NSMutableAttributedString(string: "전화번호, 사용자 이름 또는 이메일")
            .set(font: UIHelper.getFont(name: "AppleSDGothicNeo-Bold", size: 13))
            .set(fontColor: #colorLiteral(red: 0.5215686275, green: 0.5215686275, blue: 0.5215686275, alpha: 1))
    }
    
    private func configureTextFieldRightView() {
        let rightViewSize = CGSize(width: 55, height: 40)
        let deleteButtonSize = CGSize(width: 24, height: 24)
        
        let deleteButtonX = (rightViewSize.width - deleteButtonSize.width) / 2
        let deleteButtonY = (rightViewSize.height - deleteButtonSize.height) / 2
        let deleteButtonOrigin = CGPoint(x: deleteButtonX, y: deleteButtonY)
        
        let deleteButton = UIButton(frame: CGRect(origin: deleteButtonOrigin, size: deleteButtonSize))
        deleteButton.tintColor = #colorLiteral(red: 0.7490196078, green: 0.7490196078, blue: 0.7490196078, alpha: 1)
        deleteButton.addTarget(self, action: #selector(touchedDeleteButton(_:)), for: .touchUpInside)
        
        let daleteImage = UIHelper.getImage(name: "DeleateImage")
        deleteButton.setImage(daleteImage, for: .normal)
        
        let rightView = UIView(frame: CGRect(origin: .zero, size: rightViewSize))
        rightView.addSubview(deleteButton)
        
        textField.rightView = rightView
        textField.rightViewMode = .whileEditing
    }
    
    private func configureTextFieldAction() {
        textField.addTarget(self, action: #selector(textFieldDidChange), for: .editingChanged)
    }
}

extension UsernameView {
    
    @objc private func touchedDeleteButton(_ button: UIButton) {
        textField.text = ""
        textFieldDidChange()
    }
    
    @objc private func textFieldDidChange() {
        textDidChange?()
    }
}
