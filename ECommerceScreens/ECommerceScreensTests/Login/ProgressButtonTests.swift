//
//  ProgressButton.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 12/04/25.
//

import XCTest
import ECommerceScreens

final class ProgressButtonTests: XCTestCase {

    func test_title_isConfigured() {
        // Arrange & Act
        let title: String = "Test Title"
        let sut = ProgressButton(title: title)
        
        // Assert
        XCTAssertEqual(sut.buttonTitle(for: .normal), title)
    }

}
