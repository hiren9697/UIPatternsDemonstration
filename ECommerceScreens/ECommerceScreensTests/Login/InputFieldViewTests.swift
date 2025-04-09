//
//  InputFieldViewTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import XCTest
@testable import ECommerceScreens

final class InputFieldViewTests: XCTestCase {
    func test_iconImage_isAssignedProperly_1() {
        // Arrange & Act
        let iconImage = UIImage.make(withColor: .blue)
        let sut = makeSUT(iconImage: iconImage)
        
        // Assert
        XCTAssertEqual(sut.iconImage, iconImage)
    }
    
    func test_iconImage_isAssignedProperly_2() {
        // Arrange & Act
        let iconImage = UIImage.make(withColor: .orange)
        let sut = makeSUT(iconImage: iconImage)
        
        // Assert
        XCTAssertEqual(sut.iconImage, iconImage)
    }
    
    func test_placeholderText_isAssignedProperly_1() {
        // Arrange & Act
        let placeholder = "First test placeholder"
        let sut = makeSUT(placeholder: placeholder)
        
        // Assert
        XCTAssertEqual(sut.placeholderText, placeholder)
    }
    
    func test_placeholderText_isAssignedProperly_2() {
        // Arrange & Act
        let placeholder = "Second test placeholder"
        let sut = makeSUT(placeholder: placeholder)
        
        // Assert
        XCTAssertEqual(sut.placeholderText, placeholder)
    }
    
    func test_keyboardType_isAssignedProperly_1() {
        // Arrange & Act
        let keyboardType: UIKeyboardType = .URL
        let sut = makeSUT(keyboardType: keyboardType)
        
        // Assert
        XCTAssertEqual(sut.keyboardType, keyboardType)
    }
    
    func test_keyboardType_isAssignedProperly_2() {
        // Arrange & Act
        let keyboardType: UIKeyboardType = .emailAddress
        let sut = makeSUT(keyboardType: keyboardType)
        
        // Assert
        XCTAssertEqual(sut.keyboardType, keyboardType)
    }
    
    func test_returnkeyType_isAssignedProperly_1() {
        // Arrange & Act
        let returnKeyType: UIReturnKeyType = .done
        let sut = makeSUT(returnKeyType: returnKeyType)
        
        // Assert
        XCTAssertEqual(sut.returnKeyType, returnKeyType)
    }
    
    func test_returnkeyType_isAssignedProperly_2() {
        // Arrange & Act
        let returnKeyType: UIReturnKeyType = .next
        let sut = makeSUT(returnKeyType: returnKeyType)
        
        // Assert
        XCTAssertEqual(sut.returnKeyType, returnKeyType)
    }
    
    func test_isSecureTextEntry_isAssignedProperly_1() {
        // Arrange & Act
        let isSecureTextEntry: Bool = true
        let sut = makeSUT(isSecureTextEntry: isSecureTextEntry)
        
        // Assert
        XCTAssertEqual(sut.isSecureTextEntry, isSecureTextEntry)
    }
    
    func test_isSecureTextEntry_isAssignedProperly_2() {
        // Arrange & Act
        let isSecureTextEntry: Bool = false
        let sut = makeSUT(isSecureTextEntry: isSecureTextEntry)
        
        // Assert
        XCTAssertEqual(sut.isSecureTextEntry, isSecureTextEntry)
    }
    
    func test_passwordVisibilityUI_isVisible_withSecureTextEntry() {
        // Arrange & Act
        let sut = makeSUT(isSecureTextEntry: true)
        
        // Assert
        XCTAssertTrue(sut.isPasswordVisibilityToggleControlVisible)
    }
    
    func test_passwordVisibilityUI_isNotVisible_withNormalTextEntry() {
        // Arrange & Act
        let sut = makeSUT(isSecureTextEntry: false)
        
        // Assert
        XCTAssertFalse(sut.isPasswordVisibilityToggleControlVisible)
    }
    
    func test_passwordVisibilityUITap_togglePasswordVisibility() {
        // Arrange & Act
        let sut = makeSUT(isSecureTextEntry: true)
        
        // Assert
        XCTAssertTrue(sut.isSecureTextEntry,
                      "Expected password not visible initially")
        XCTAssertTrue(sut.isPasswordVisibilityToggleControlShowingShowPasswordOption,
                      "Expected password visibility UI to show 'Show password' option initially")
        
        // Act
        sut.simulatePasswordVisibilityToggleTap()
        
        // Assert
        XCTAssertFalse(sut.isSecureTextEntry,
                      "Expected password visible after first tap")
        XCTAssertTrue(sut.isPasswordVisibilityToggleControlShowingHidePasswordOption,
                      "Expected password visibility UI to show 'Hide password' option after first tap")
        
        // Act
        sut.simulatePasswordVisibilityToggleTap()
        
        // Assert
        XCTAssertTrue(sut.isSecureTextEntry,
                      "Expected password not visible after second tap")
        XCTAssertTrue(sut.isPasswordVisibilityToggleControlShowingShowPasswordOption,
                      "Expected password visibility UI to show 'Show password' option after second tap")
    }
    
    func test_becomeFirstResponder() {
        // Arrange
        let sut = makeSUT()
        let window = UIWindow()
        window.addSubview(sut)
        
        // Act
        sut.makeInputFirstResponder()
        
        // Assert
        XCTAssertTrue(sut.isInputFirstResponder)
    }
    
    func test_resignsFirstResponder() {
        // Arrange
        let sut = makeSUT()
        let window = UIWindow()
        window.addSubview(sut)
        sut.makeInputFirstResponder()

        // Act
        sut.makeInputRsignResponder()
        
        // Assert
        XCTAssertFalse(sut.isInputFirstResponder)
    }
    
    func test_onReturn() {
        // Arrange
        var onReturnCalls: [Bool] = []
        let sut = makeSUT(onReturn: {
            onReturnCalls.append(true)
            return true
        })
        
        // Act
        sut.simulateShouldReturnOnInputField()
        
        // Assert
        XCTAssertEqual(onReturnCalls, [true])
    }
    
    private func makeSUT(iconImage: UIImage = UIImage.make(withColor: .blue),
                         placeholder: String = "Test",
                         keyboardType: UIKeyboardType = .asciiCapable,
                         returnKeyType: UIReturnKeyType = .next,
                         isSecureTextEntry: Bool = false,
                         onReturn: @escaping InputFieldView.OnReturn = { true },
                         file: StaticString = #filePath,
                         line: UInt = #line) -> InputFieldView {
        let view = InputFieldView(iconImage: iconImage,
                                  placeholder: placeholder,
                                  keyboardType: keyboardType,
                                  returnKeyType: returnKeyType,
                                  isSecureTextEntry: isSecureTextEntry,
                                  onReturn: onReturn)
        view.layoutSubviews()
        trackMemory(for: view,
                    file: file,
                    line: line)
        return view
    }
}

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
