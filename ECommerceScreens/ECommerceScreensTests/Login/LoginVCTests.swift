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

}
