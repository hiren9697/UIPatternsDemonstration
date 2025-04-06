//
//  LoginVCTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import XCTest
@testable import ECommerceScreens

final class LoginVCTests: XCTestCase {
    func test_welcomeText_isCorrect() {
        // Arrange & Act
        let sut = makeSUT()
        
        // Assert
        XCTAssertEqual(sut.welcomeLabel.text, "Welcome\nBack!")
    }
    
    func test_welcomeText_hasCorrectAttributes() {
        // Arrange & Act
        let sut = makeSUT()
        
        // Assert
        XCTAssertEqual(sut.welcomeLabel.font,
                       .boldSystemFont(ofSize: 36),
                       "Expected font to be boldSystemFont(ofSize: 36)")
        XCTAssertEqual(sut.welcomeLabel.textColor,
                       AppColors.c000000,
                       "Expected textColor to be AppColors.c000000")
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
