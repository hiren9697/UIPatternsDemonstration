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
    
    public init(iconImage: UIImage, placeholder: String) {
        self.iconImage = iconImage
        self.placeholder = placeholder
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("LoginVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    private func configureUI() {
        iconImageView.image = iconImage
        textField.placeholder = placeholder
    }
}
