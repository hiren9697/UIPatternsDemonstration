//
//  PRSortViewTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 22/04/25.
//

import XCTest
import ECommerceScreens

class PRSortViewTests: XCTestCase {
    func test_present_addsSortViewInParentView() {
        // Arrange
        let viewController = UIViewController()

        // Act
        let sut = PRSortView.present(in: viewController.view)

        // Assert
        XCTAssertEqual(sut.superview, viewController.view)
    }
}
