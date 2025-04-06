//
//  InputFieldViewTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import XCTest
@testable import ECommerceScreens

final class InputFieldViewTests: XCTestCase {
    func test_iconImage() {
        // Arrange & Act
        let iconImage = UIImage.make(withColor: .blue)
        let sut = makeSUT(iconImage: iconImage)
        
        // Assert
        XCTAssertEqual(sut.iconImage, iconImage)
    }
    
    func test_placeholderText() {
        // Arrange & Act
        let placeholder = "Test placeholder"
        let sut = makeSUT(placeholder: placeholder)
        
        // Assert
        XCTAssertEqual(sut.placeholderText, placeholder)
    }
    
    func test_keyboardType() {
        // Arrange & Act
        let keyboardType: UIKeyboardType = .URL
        let sut = makeSUT(keyboardType: keyboardType)
        
        // Assert
        XCTAssertEqual(sut.keyboardType, keyboardType)
    }
    
    func test_returnkeyType() {
        // Arrange & Act
        let returnKeyType: UIReturnKeyType = .done
        let sut = makeSUT(returnKeyType: returnKeyType)
        
        // Assert
        XCTAssertEqual(sut.returnKeyType, returnKeyType)
    }
    
    func test_isSecure() {
        // Arrange & Act
        let isSecure: Bool = true
        let sut = makeSUT(isSecure: isSecure)
        
        // Assert
        XCTAssertEqual(sut.isSecure, isSecure)
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
}
