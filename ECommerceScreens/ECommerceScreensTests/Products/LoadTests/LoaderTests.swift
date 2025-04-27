//
//  LoaderTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import XCTest
import ECommerceScreens

class LoaderTests: XCTestCase {
//    func test_activityIndicator_isPartOfViewHierarchy() {
//        // Arrange
//        let sut = Loader()
//        
//        // Assert
//        XCTAssertEqual(sut.activityIndicator.superview, sut.containerView)
//    }
    
    func test_activityIndcatorAnimates_onShow_andHides_onHide() {
        // Arrange
        let sut = Loader()
        
        // Assert
        XCTAssertFalse(sut.isActivityIndicatorAnimating, "Expected activity indicator to not animating initially")
        
        // Act
        sut.show()
        
        // Assert
        XCTAssertTrue(sut.isActivityIndicatorAnimating, "Expected activity indicator to animating after `show()`")
        
        // Act
        sut.hide()
        XCTAssertFalse(sut.isActivityIndicatorAnimating, "Expected activity indicator to not animating after `hide()`")
    }
}
