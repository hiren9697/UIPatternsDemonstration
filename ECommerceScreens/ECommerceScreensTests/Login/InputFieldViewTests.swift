//
//  InputFieldViewTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import XCTest
@testable import ECommerceScreens

final class InputFieldViewTests: XCTestCase {
    func test_iconImage_1() {
        // Arrange & Act
        let iconImage = UIImage.make(withColor: .blue)
        let sut = makeSUT(iconImage: iconImage)
        
        // Assert
        XCTAssertEqual(sut.iconImage, iconImage)
    }
    
    func test_iconImage_2() {
        // Arrange & Act
        let iconImage = UIImage.make(withColor: .orange)
        let sut = makeSUT(iconImage: iconImage)
        
        // Assert
        XCTAssertEqual(sut.iconImage, iconImage)
    }
    
    func test_placeholderText_1() {
        // Arrange & Act
        let placeholder = "First test placeholder"
        let sut = makeSUT(placeholder: placeholder)
        
        // Assert
        XCTAssertEqual(sut.placeholderText, placeholder)
    }
    
    func test_placeholderText_2() {
        // Arrange & Act
        let placeholder = "Second test placeholder"
        let sut = makeSUT(placeholder: placeholder)
        
        // Assert
        XCTAssertEqual(sut.placeholderText, placeholder)
    }
    
    func test_keyboardType_1() {
        // Arrange & Act
        let keyboardType: UIKeyboardType = .URL
        let sut = makeSUT(keyboardType: keyboardType)
        
        // Assert
        XCTAssertEqual(sut.keyboardType, keyboardType)
    }
    
    func test_keyboardType_2() {
        // Arrange & Act
        let keyboardType: UIKeyboardType = .emailAddress
        let sut = makeSUT(keyboardType: keyboardType)
        
        // Assert
        XCTAssertEqual(sut.keyboardType, keyboardType)
    }
    
    func test_returnkeyType_1() {
        // Arrange & Act
        let returnKeyType: UIReturnKeyType = .done
        let sut = makeSUT(returnKeyType: returnKeyType)
        
        // Assert
        XCTAssertEqual(sut.returnKeyType, returnKeyType)
    }
    
    func test_returnkeyType_2() {
        // Arrange & Act
        let returnKeyType: UIReturnKeyType = .next
        let sut = makeSUT(returnKeyType: returnKeyType)
        
        // Assert
        XCTAssertEqual(sut.returnKeyType, returnKeyType)
    }
    
    func test_isSecure_1() {
        // Arrange & Act
        let isSecure: Bool = true
        let sut = makeSUT(isSecure: isSecure)
        
        // Assert
        XCTAssertEqual(sut.isSecure, isSecure)
    }
    
    func test_isSecure_2() {
        // Arrange & Act
        let isSecure: Bool = false
        let sut = makeSUT(isSecure: isSecure)
        
        // Assert
        XCTAssertEqual(sut.isSecure, isSecure)
    }
    
    func test_passwordVisibilityUI_isVisible_withSecureTextEntry() {
        // Arrange & Act
        let sut = makeSUT(isSecure: true)
        
        // Assert
        XCTAssertTrue(sut.isPasswordVisibilityUIVisible)
    }
    
    func test_passwordVisibilityUI_isNotVisible_withNormalTextEntry() {
        // Arrange & Act
        let sut = makeSUT(isSecure: false)
        
        // Assert
        XCTAssertFalse(sut.isPasswordVisibilityUIVisible)
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
    
    private func makeSUT(iconImage: UIImage = UIImage.make(withColor: .blue),
                         placeholder: String = "Test",
                         keyboardType: UIKeyboardType = .asciiCapable,
                         returnKeyType: UIReturnKeyType = .next,
                         isSecure: Bool = false,
                         file: StaticString = #filePath,
                         line: UInt = #line) -> InputFieldView {
        let view = InputFieldView(iconImage: iconImage,
                                  placeholder: placeholder,
                                  keyboardType: keyboardType,
                                  returnKeyType: returnKeyType,
                                  isSecure: isSecure)
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
    
    var isSecure: Bool {
        textField.isSecureTextEntry
    }
    
    var isPasswordVisibilityUIVisible: Bool {
        !passwordVisibility.isHidden
    }
    
    var isInputFirstResponder: Bool {
        textField.isFirstResponder
    }
}
