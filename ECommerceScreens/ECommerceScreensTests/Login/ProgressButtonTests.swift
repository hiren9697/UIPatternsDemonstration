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
        let sut = makeSUT(title: title)
        
        // Assert
        XCTAssertEqual(sut.buttonTitle(for: .normal), title)
    }
    
    func test_titleColor_isConfigured() {
        // Arrange & Act
        let titleColor: UIColor = AppColors.cFFFFFF
        let sut = makeSUT(titleColor: titleColor)
        
        // Assert
        XCTAssertEqual(sut.buttonTitleColor(for: .normal), titleColor)
    }
    
    // MARK: - Helper
    private func makeSUT(title: String = "Test Title",
                         titleColor: UIColor = UIColor.white) -> ProgressButton {
        let sut = ProgressButton(title: title, titleColor: titleColor)
        trackMemory(for: sut)
        return sut
    }

}
