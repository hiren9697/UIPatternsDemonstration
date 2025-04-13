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
    var forgotPasswordButtonBackgroundColor: UIColor? {
        forgotPasswordButton.backgroundColor
    }
    var loginButtonTitle: String? {
        // loginButton.title(for: .normal)
        loginButton.buttonTitle(for: .normal)
    }
    var loginButtonTitleColor: UIColor? {
        // loginButton.titleColor(for: .normal)
        loginButton.buttonTitleColor(for: .normal)
    }
    var loginButtonBackgroundColor: UIColor? {
        loginButton.containerViewBackgroundColor()
    }
    func simulateForgotPasswordTap() {
        forgotPasswordButton.simulateTap()
    }
    func simulateLoginTap() {
        // loginButton.simulateTap()
        loginButton.simulateButtonClick()
    }
}
