//
//  LoginVCTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import XCTest
@testable import ECommerceScreens

/// Notes:
/// To make first responder in tests you can either:
/// 1. let window = UIWindow()
///   window.rootViewController = sut
///   window.makeKeyAndVisible()
///   `sut.emailField.layoutSubviews()` This is because as we are in tests layout doesn't happen so we have to manually call it's layout methods, even calling `view.layoutSubViews()` not calling `layoutSubViews()` on input field
///   Test execution time: 0.319, 0.267, 0.243, 0.253 seconds
/// 2. let window = UIWindow()
///   window.addSubview(sut.view)
///   `sut.emailField.layoutSubviews()` This is because as we are in tests layout doesn't happen so we have to manually call it's layout methods even calling `view.layoutSubViews()` not calling `layoutSubViews()` on input field
///   Test execution time: 0.09, 0.111, 0.114, 0.127 seconds

final class LoginVCTests: XCTestCase {
    func test_welcomeText_isConfiguredWithCorrectTextAndAttributes() {
        // Arrange & Act
        let sut = makeSUT()
        
        // Assert
        XCTAssertEqual(sut.welcomeLabel.text,
                       "Welcome\nBack!",
                       "Expected text to be Welcome\nBack!, but got \(String(describing: sut.welcomeLabel.text)) instead")
        XCTAssertEqual(sut.welcomeLabel.font,
                       .boldSystemFont(ofSize: 36),
                       "Expected font to be boldSystemFont(ofSize: 36), but got \(String(describing: sut.welcomeLabel.font)) instead")
        XCTAssertEqual(sut.welcomeLabel.textColor,
                       AppColors.c000000,
                       "Expected textColor to be AppColors.c000000, but got \(String(describing: sut.welcomeLabel.textColor)) instead")
    }
    
    func test_emailField_isConfiguredWithCorrectAttributes() {
        // Arrange && Act
        let sut = makeSUT()
        
        // Assert
        XCTAssertEqual(sut.emailField.iconImage,
                       UIImage(namedWithInBundle: "ic_mail")!,
                       "Expected mail icon but got \(String(describing: sut.emailField.iconImage)) instead")
        XCTAssertEqual(sut.emailField.placeholderText,
                       "Email",
                       "Expected 'Email' placeholder but got \(String(describing: sut.emailField.placeholderText)) instead")
        XCTAssertEqual(sut.emailField.keyboardType,
                       .emailAddress,
                       "Expected 'emailAddress' keyboard type but got \(String(describing: sut.emailField.keyboardType)) instead")
        XCTAssertEqual(sut.emailField.returnKeyType,
                       .next,
                       "Expected 'next' return key but got \(String(describing: sut.emailField.returnKeyType)) instead")
        XCTAssertEqual(sut.emailField.isSecureTextEntry,
                       false,
                       "Expected normal text entry but got \(String(describing: sut.emailField.isSecureTextEntry)) instead")
    }
    
    func test_passwordField_isConfiguredWithCorrectAttributes() {
        // Arrange && Act
        let sut = makeSUT()
        
        // Assert
        XCTAssertEqual(sut.passwordField.iconImage,
                       UIImage(namedWithInBundle: "ic_password")!,
                       "Expected password icon but got \(String(describing: sut.passwordField.iconImage)) instead")
        XCTAssertEqual(sut.passwordField.placeholderText,
                       "Password",
                       "Expected 'Password' placeholder but got \(String(describing: sut.passwordField.placeholderText)) instead")
        XCTAssertEqual(sut.passwordField.keyboardType,
                       .asciiCapable,
                       "Expected 'asciiCapable' keyboard type but got \(String(describing: sut.passwordField.keyboardType)) instead")
        XCTAssertEqual(sut.passwordField.returnKeyType,
                       .done,
                       "Expected 'done' return key but got \(String(describing: sut.passwordField.returnKeyType)) instead")
        XCTAssertEqual(sut.passwordField.isSecureTextEntry,
                       true,
                       "Expected secure text entry but got \(String(describing: sut.passwordField.isSecureTextEntry)) instead")
    }
    
    func test_emailInputFieldReturnKeyClick_makesPasswordInputFieldFirstResponder() {
        // Arrange
        let sut = makeSUT()
        let window = UIWindow()
        window.addSubview(sut.view)
        sut.emailField.layoutSubviews()
        sut.passwordField.layoutSubviews()

        // Act
        sut.emailField.makeInputFirstResponder()
        
        // Assert
        XCTAssertTrue(sut.emailField.isInputFirstResponder,
                      "Expected email field to be first responder")
        
        // Act
        _ = sut.emailField.textFieldShouldReturn()
        
        // Assert
        XCTAssertTrue(sut.passwordField.isInputFirstResponder,
                      "Expected password field to be first responder")
    }
    
    func test_passwordInputFieldReturnKeyClick_makesPasswordFieldResignFirstResponder() {
        // Arrange
        let sut = makeSUT()
        let window = UIWindow()
        window.addSubview(sut.view)
        sut.passwordField.layoutSubviews()

        // Act
        sut.passwordField.makeInputFirstResponder()
        
        // Assert
        XCTAssertTrue(sut.passwordField.isInputFirstResponder,
                      "Expected passowrd field to be first responder")
        
        // Act
        _ = sut.passwordField.textFieldShouldReturn()
        
        // Assert
        XCTAssertFalse(sut.passwordField.isInputFirstResponder,
                      "Expected password field to not be first responder")
    }
    
    func test_forgotPasswordButton_configuredWithCorrectAttributes() {
        // Arrange & Act
        let sut = makeSUT()
        
        // Assert
        let expectedTitle: String = "Forgot Password?"
        let expectedTitleColor: UIColor = AppColors.cF83758
        let expectedBackgroundColor: UIColor = AppColors.cFFFFFF
        XCTAssertEqual(sut.forgotPasswordButtonTitle,
                       expectedTitle,
                       "Expected title of forgot password button: \(expectedTitle), but got \(String(describing: sut.forgotPasswordButtonTitle)) instead")
        XCTAssertEqual(sut.forgotPasswordButtonTitleColor,
                       expectedTitleColor,
                       "Expected title color of forgot password button: \(expectedTitleColor), bug got \(String(describing: sut.forgotPasswordButtonTitleColor)) instead")
        XCTAssertEqual(sut.forgotPasswordButtonBackgroundColor,
                       expectedBackgroundColor,
                       "Expected background color of forgot password button: \(expectedBackgroundColor), bug got \(String(describing: sut.forgotPasswordButtonBackgroundColor)) instead")
    }
    
    func test_forgotPasswordClick_callsOnForgotPassword() {
        // Arrange
        var forgotPasswordCalls: [Bool] = []
        let sut = makeSUT(onForgotPasswordTap: { forgotPasswordCalls.append(true) })

        // Act
        sut.simulateForgotPasswordTap()
        
        // Assert
        XCTAssertEqual(forgotPasswordCalls, [true])
    }
    
    func test_loginButton_configuredWithCorrectAttributes() {
        // Arrange & Act
        let sut = makeSUT()
        
        // Assert
        let expectedTitle: String = "Login"
        let expectedTitleColor: UIColor = AppColors.cFFFFFF
        let expectedBackgroundColor: UIColor = AppColors.cF83758
        XCTAssertEqual(sut.loginButtonTitle,
                       expectedTitle,
                       "Expected title of login button: \(expectedTitle), but got \(String(describing: sut.loginButtonTitle)) instead")
        XCTAssertEqual(sut.loginButtonTitleColor,
                       expectedTitleColor,
                       "Expected title color of login button: \(expectedTitleColor), bug got \(String(describing: sut.loginButtonTitleColor)) instead")
        XCTAssertEqual(sut.loginButtonBackgroundColor,
                       expectedBackgroundColor,
                       "Expected background color of login button: \(expectedTitleColor), bug got \(String(describing: sut.loginButtonBackgroundColor)) instead")
    }
    
    func test_loginClick_onEmptyEmail_showsError() {
        // Arrange
        let spy: LoginServiceSpy = LoginServiceSpy()
        let toast: ToastSpy = ToastSpy()
        let sut = makeSUT(toast: toast,
                          service: spy)

        // Act
        sut.simulateLoginTap()
        
        // Assert
        XCTAssertEqual(spy.loginRequests,
                       [],
                       "Expected service to receive no login requests, if email is empty, but got \(spy.loginRequests) instead")
        XCTAssertEqual(toast.messages,
                       [ToastMessage(type: .failure, message: "Please enter email")])
    }
    
    func test_loginClick_onInvalidEmail_showsError() {
        // Arrange
        let spy: LoginServiceSpy = LoginServiceSpy()
        let toast: ToastSpy = ToastSpy()
        let sut = makeSUT(toast: toast,
                          service: spy)
        sut.emailField.setText("invalidEmail")

        // Act
        sut.simulateLoginTap()
        
        // Assert
        XCTAssertEqual(spy.loginRequests,
                       [],
                       "Expected service to receive no login requests, if entered email is invalid, but got \(spy.loginRequests) instead")
        XCTAssertEqual(toast.messages,
                       [ToastMessage(type: .failure, message: "Please enter a valid email")])
    }
    
    func test_loginClick_onEmptyPassword_showsError() {
        // Arrange
        let spy: LoginServiceSpy = LoginServiceSpy()
        let toast: ToastSpy = ToastSpy()
        let sut = makeSUT(toast: toast,
                          service: spy)
        sut.emailField.setText("valid@email.com")

        // Act
        sut.simulateLoginTap()
        
        // Assert
        XCTAssertEqual(spy.loginRequests,
                       [],
                       "Expected service to receive no login requests, if password is empty, but got \(spy.loginRequests) instead")
        XCTAssertEqual(toast.messages,
                       [ToastMessage(type: .failure, message: "Please enter password")])
    }
    
    func test_loginClick_onValidEmailAndPassword_callsOnLogin() {
        // Arrange
        let spy: LoginServiceSpy = LoginServiceSpy()
        let toast: ToastSpy = ToastSpy()
        let sut = makeSUT(toast: toast, service: spy)
        let email = "valid@email.com"
        let password = "TestPassword"
        sut.emailField.setText(email)
        sut.passwordField.setText(password)

        // Act
        sut.simulateLoginTap()
        
        // Assert
        let expectedLoginServiceInputData = LoginServiceInputData(email: email, password: password)
        XCTAssertEqual(spy.loginRequests,
                       [expectedLoginServiceInputData],
                       "Expected login button click to call login service with \(expectedLoginServiceInputData), if email and password are valid, but got \(spy.loginRequests) instead")
        XCTAssertEqual(toast.messages,
                       [],
                       "Expected no toast messages, if email and password are valid, but got \(toast.messages) instead")
    }
    
    // MARK: - Helper
    private func makeSUT(toast: Toast = ToastSpy(),
                         onForgotPasswordTap: @escaping () -> Void = {},
                         service: LoginServiceSpy = LoginServiceSpy(),
                         file: StaticString = #filePath,
                         line: UInt = #line) -> LoginVC {
        let sut = LoginVC(toast: toast,
                          onForgotPasswordTap: onForgotPasswordTap,
                          service: service)
        sut.loadViewIfNeeded()
        trackMemory(for: sut,
                    file: file,
                    line: line)
        return sut
    }
    
    private class ToastSpy: Toast {
        var messages: [ToastMessage] = []
        
        func present(message: ToastMessage) {
            messages.append(message)
        }
    }
    
    private class LoginServiceSpy: LoginService {
        struct Message {
            let data: LoginServiceInputData
            let completion: LoginService.Completion
        }
        var messages: [Message] = []
        var loginRequests: [LoginServiceInputData] {
            messages.map { $0.data }
        }
        
        func login(with data: LoginServiceInputData, completion: @escaping LoginService.Completion) {
            messages.append(Message(data: data,
                                    completion: completion))
        }
    }
}
