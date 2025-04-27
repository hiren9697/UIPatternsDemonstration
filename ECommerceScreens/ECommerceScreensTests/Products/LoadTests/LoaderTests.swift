//
//  LoaderTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import XCTest
import ECommerceScreens

class LoaderTests: XCTestCase {
    func test_activityIndicator_isPartOfViewHierarchy() {
        // Arrange
        let sut = Loader()
        
        // Assert
        XCTAssertEqual(sut.activityIndicator.superview, sut.containerView)
    }
}
