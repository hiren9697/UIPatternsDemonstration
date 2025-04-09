//
//  LoginVCTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import XCTest
@testable import ECommerceScreens

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
    
    // MARK: - Helper
    private func makeSUT(file: StaticString = #filePath,
                         line: UInt = #line) -> LoginVC {
        let sut = LoginVC()
        sut.loadViewIfNeeded()
        trackMemory(for: sut,
                    file: file,
                    line: line)
        return sut
    }
}
