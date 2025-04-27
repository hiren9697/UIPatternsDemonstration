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
        let (sut, productLoader) = makeSUT()
        
        // Assert
        XCTAssertEqual(productLoader.requestCount,
                       0,
                       "Expected no requests before viewIsAppearing")
        
        // Act
        sut.simulateViewIsAppearing()
        
        // Assert
        XCTAssertEqual(productLoader.requestCount,
                       1,
                       "Expected one request after viewIsAppearing")
        
        // Act
        sut.simulateUserInitiatedRefresh()
        
        // Assert
        XCTAssertEqual(productLoader.requestCount,
                       2,
                       "Expected another request after user initiated refresh")
        
        // Act
        sut.simulateUserInitiatedRefresh()
        
        // Assert
        XCTAssertEqual(productLoader.requestCount,
                       3,
                       "Expected another request after user initiated another refresh")
    }
    
//    func test_loadingProductIndicator_isVisible_whenLoadingProductAfterViewIsAppearing() {
//        // Arrange
//        let (sut, _) = makeSUT()
//        
//        // Assert
//        XCTAssertFalse(sut.isShowingProductLoadingIndicator, "Expected no loading indicator before viewIsAppearing called")
//        
//        // Act
//        
//        // Assert
//    }
    
    private func makeSUT(file: StaticString = #filePath, line: UInt = #line) -> (PRBasicMVCViewController, ProductStoreSpy) {
        let productLoader = ProductStoreSpy()
        let sut = PRBasicMVCViewController(productLoader: productLoader)
        trackMemory(for: productLoader,
                    file: file,
                    line: line)
        trackMemory(for: sut,
                    file: file,
                    line: line)
        return (sut, productLoader)
    }
    
    // MARK: - Helper Class
    private class ProductStoreSpy: ProductStore {
        var requestCount: Int = 0
        
        func loadProducts(completion: @escaping Completion) {
            requestCount += 1
        }
    }
}


