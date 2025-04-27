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
        let (sut, loader) = makeSUT()
        
        // Assert
        XCTAssertEqual(loader.requestCount,
                       0,
                       "Expected no requests before viewIsAppearing")
        
        // Act
        sut.simulateViewIsAppearing()
        
        // Assert
        XCTAssertEqual(loader.requestCount,
                       1,
                       "Expected one request after viewIsAppearing")
        
        // Act
        sut.simulateUserInitiatedRefresh()
        
        // Assert
        XCTAssertEqual(loader.requestCount,
                       2,
                       "Expected another request after user initiated refresh")
        
        // Act
        sut.simulateUserInitiatedRefresh()
        
        // Assert
        XCTAssertEqual(loader.requestCount,
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
        let loader = ProductStoreSpy()
        let sut = PRBasicMVCViewController(loader: loader)
        trackMemory(for: loader,
                    file: file,
                    line: line)
        trackMemory(for: sut,
                    file: file,
                    line: line)
        return (sut, loader)
    }
    
    // MARK: - Helper Class
    private class ProductStoreSpy: ProductStore {
        var requestCount: Int = 0
        
        func loadProducts(completion: @escaping Completion) {
            requestCount += 1
        }
    }
}


