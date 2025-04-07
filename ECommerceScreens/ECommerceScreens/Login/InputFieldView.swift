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
        passwordVisibility.setImage(UIImage(named: "ic_show_password",
                                            in: Bundle(identifier: "hiren.ECommerceScreens"),
                                            with: nil),
                                    for: .normal)
        passwordVisibility.addTarget(self, action: #selector(passwordVisibilityTap), for: .touchUpInside)
        
        addSubview(textField)
    }
    
    func makeInputFirstResponder() {
        textField.becomeFirstResponder()
    }
    
    func makeInputRsignResponder() {
        textField.resignFirstResponder()
    }
    
    @objc func passwordVisibilityTap() {
        textField.isSecureTextEntry.toggle()
        guard let showPasswordImage = UIImage(named: "ic_show_password",
                                              in: Bundle(identifier: "hiren.ECommerceScreens"),
                                              with: nil) else {
            return
        }
        guard let hidePasswordImage = UIImage(named: "ic_hide_password",
                                              in: Bundle(identifier: "hiren.ECommerceScreens"),
                                              with: nil) else {
            return
        }
        let image = textField.isSecureTextEntry ? showPasswordImage : hidePasswordImage
        passwordVisibility.setImage(image, for: .normal)
    }
}
