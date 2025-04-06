//
//  InputContainerView.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class InputFieldView: UIView {
    let iconImageView: UIImageView = UIImageView()
    let textField: UITextField = UITextField()
    let passwordVisibility: UIButton = UIButton()
    
    let iconImage: UIImage
    let placeholder: String
    let keyboardType: UIKeyboardType
    let returnKeyType: UIReturnKeyType
    let isSecure: Bool
    
    public init(iconImage: UIImage,
                placeholder: String,
                keyboardType: UIKeyboardType,
                returnKeyType: UIReturnKeyType,
                isSecure: Bool) {
        self.iconImage = iconImage
        self.placeholder = placeholder
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
        self.isSecure = isSecure
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("LoginVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    private func configureUI() {
        iconImageView.image = iconImage
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.returnKeyType = returnKeyType
        textField.isSecureTextEntry = isSecure
        passwordVisibility.isHidden = !isSecure
        
        addSubview(textField)
    }
    
    func makeInputFirstResponder() {
        textField.becomeFirstResponder()
    }
    
    func makeInputRsignResponder() {
        textField.resignFirstResponder()
    }
}
