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
        let sut = InputFieldView(iconImage: iconImage)
        
        // Assert
        XCTAssertEqual(sut.iconImage, iconImage)
    }
}

extension InputFieldView {
    var iconImage: UIImage? {
        iconImageView.image
    }
}
