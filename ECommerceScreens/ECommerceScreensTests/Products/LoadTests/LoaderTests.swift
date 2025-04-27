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
    
    func test_activityIndicator_onShowAndHide() {
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
    
    func test_visibility_onShowAndHide() {
        // Arrange
        let sut = Loader()
        
        // Assert
        XCTAssertTrue(sut.isHidden, "Expected loader not initially")
        
        // Act
        sut.show()
        
        // Assert
        XCTAssertFalse(sut.isHidden, "Expected loader to be visible after `show()`")
        
        // Act
        sut.hide()
        XCTAssertTrue(sut.isHidden, "Expected loader not visible after `hide()`")
    }
}
