//
//  LoginVC+TestHelpers.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 10/04/25.
//

import UIKit
@testable import ECommerceScreens

extension LoginVC {
    var forgotPasswordButtonTitle: String? {
        forgotPasswordButton.title(for: .normal)
    }
    var forgotPasswordButtonTitleColor: UIColor? {
        forgotPasswordButton.titleColor(for: .normal)
    }
    func simulateForgotPasswordTap() {
        forgotPasswordButton.simulateTap()
    }
}
