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
    
    let iconImage: UIImage
    let placeholder: String
    let keyboardType: UIKeyboardType
    
    public init(iconImage: UIImage, placeholder: String, keyboardType: UIKeyboardType) {
        self.iconImage = iconImage
        self.placeholder = placeholder
        self.keyboardType = keyboardType
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
    }
}
