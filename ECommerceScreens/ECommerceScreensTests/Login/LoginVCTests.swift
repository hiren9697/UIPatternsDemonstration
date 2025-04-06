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
        let sut = LoginVC()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.welcomeLabel.text, "Welcome\nBack!")
    }
    
    func test_welcomeText_hasCorrectAttributes() {
        let sut = LoginVC()
        sut.loadViewIfNeeded()
        XCTAssertEqual(sut.welcomeLabel.font,
                       .boldSystemFont(ofSize: 36),
                       "Expected font to be boldSystemFont(ofSize: 36)")
        XCTAssertEqual(sut.welcomeLabel.textColor,
                       AppColors.c000000,
                       "Expected textColor to be AppColors.c000000")
    }
}
