//
//  PRBasicMVCTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 22/04/25.
//

import XCTest
import ECommerceScreens

class PRBasicMVCTests: XCTestCase {
    func test_loadProductActions_requestsProductFromLoad() {
        // Arrange
        let loader = ProductStoreSpy()
        let _ = PRBasicMVCViewController(loader: loader)
        
        // Assert
        XCTAssertEqual(loader.requestCount,
                       0,
                       "Expected no requests before view is appearing")
        }
    
    // MARK: - Helper Class
    private class ProductStoreSpy: ProductStore {
        var requestCount: Int = 0
        
        func loadProducts(completion: @escaping Completion) {
        }
    }
}


