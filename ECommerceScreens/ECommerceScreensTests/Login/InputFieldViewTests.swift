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
        let sut = makeSUT(iconImage: iconImage)
        
        // Assert
        XCTAssertEqual(sut.iconImage, iconImage)
    }
    
    func test_placeholderText_isConfiuredCorrectly() {
        // Arrange & Act
        let placeholder = "Test placeholder"
        let sut = makeSUT(placeholder: placeholder)
        
        // Assert
        XCTAssertEqual(sut.placeholderText, placeholder)
    }
    
    private func makeSUT(iconImage: UIImage = UIImage.make(withColor: .blue),
                         placeholder: String = "Test",
                         file: StaticString = #filePath,
                         line: UInt = #line) -> InputFieldView {
        let view = InputFieldView(iconImage: iconImage,
                                  placeholder: placeholder)
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
}
