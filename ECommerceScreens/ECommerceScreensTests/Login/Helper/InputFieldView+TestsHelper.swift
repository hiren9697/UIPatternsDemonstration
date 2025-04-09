//
//  InputFieldViewTests+Helper.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 09/04/25.
//

import UIKit
@testable import ECommerceScreens

extension InputFieldView {
    var iconImage: UIImage? {
        iconImageView.image
    }
    
    var placeholderText: String? {
        textField.placeholder
    }
    
    var keyboardType: UIKeyboardType {
        textField.keyboardType
    }
    
    var returnKeyType: UIReturnKeyType {
        textField.returnKeyType
    }
    
    var isSecureTextEntry: Bool {
        textField.isSecureTextEntry
    }
    
    var isPasswordVisibilityToggleControlVisible: Bool {
        !passwordVisibilityToggleButton.isHidden
    }
    
    var isInputFirstResponder: Bool {
        textField.isFirstResponder
    }
    
    var isPasswordVisibilityToggleControlShowingShowPasswordOption: Bool {
        let currentImage = passwordVisibilityToggleButton.image(for: .normal)
        let showPasswordImage = UIImage(namedWithInBundle: "ic_show_password")!
        return currentImage == showPasswordImage
    }
    
    var isPasswordVisibilityToggleControlShowingHidePasswordOption: Bool {
        let currentImage = passwordVisibilityToggleButton.image(for: .normal)
        let showPasswordImage = UIImage(namedWithInBundle: "ic_hide_password")!
        return currentImage == showPasswordImage
    }
    
    func simulatePasswordVisibilityToggleTap() {
        passwordVisibilityToggleButton.simulateTap()
    }
    
    func simulateShouldReturnOnInputField() {
        _ = textField.delegate?.textFieldShouldReturn?(textField)
    }
}
