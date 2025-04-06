//
//  InputFieldViewTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import XCTest
@testable import ECommerceScreens

final class InputFieldViewTests: XCTestCase {
    func test_iconImage_isConfiuredCorrectly() {
        // Arrange & Act
        let iconImage = UIImage.make(withColor: .blue)
        let sut = InputFieldView(iconImage: iconImage, placeholder: "")
        
        // Assert
        XCTAssertEqual(sut.iconImage, iconImage)
    }
    
    func test_placeholderText_isConfiuredCorrectly() {
        // Arrange & Act
        let placeholder = "Test placeholder"
        let sut = InputFieldView(iconImage: UIImage.make(withColor: .blue), placeholder: placeholder)
        
        // Assert
        XCTAssertEqual(sut.placeholderText, placeholder)
    }
}

extension InputFieldView {
    var iconImage: UIImage? {
        iconImageView.image
    }
    
    var placeholderText: String? {
        textField.placeholder
    }
}
