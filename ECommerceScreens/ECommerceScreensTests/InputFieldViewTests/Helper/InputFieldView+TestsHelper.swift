//
//  InputFieldViewTests+Helper.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 09/04/25.
//

import UIKit
import ECommerceScreens

extension InputFieldView {
    var isPasswordVisibilityToggleControlShowingShowPasswordOption: Bool {
        let currentImage = passwordVisibilityToggleButtonImage(for: .normal)
        let showPasswordImage = UIImage(namedWithInBundle: "ic_show_password")!
        return currentImage == showPasswordImage
    }
    
    var isPasswordVisibilityToggleControlShowingHidePasswordOption: Bool {
        let currentImage = passwordVisibilityToggleButtonImage(for: .normal)
        let showPasswordImage = UIImage(namedWithInBundle: "ic_hide_password")!
        return currentImage == showPasswordImage
    }
}
