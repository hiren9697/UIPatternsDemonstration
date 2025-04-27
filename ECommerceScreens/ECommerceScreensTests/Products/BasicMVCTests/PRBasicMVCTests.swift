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
    
    func test_correctLoadingIndicator_isVisible_whenLoadingProduct() {
        // Arrange
        let (sut, loader) = makeSUT()
        sut.replaceRefreshControlWithFake()
        
        // Assert
        XCTAssertFalse(sut.isShowingProductLoadingIndicator, "Expected loading indicator not visible before viewIsAppearing called")
        XCTAssertFalse(sut.isRefreshControlRefreshing, "Expected refresh control not refreshing before viewIsAppearing called")
        
        // Act
        sut.simulateViewIsAppearing()
        
        // Assert
        XCTAssertTrue(sut.isShowingProductLoadingIndicator, "Expected loading indicator visible after viewIsAppearing called")
        XCTAssertFalse(sut.isRefreshControlRefreshing, "Expected refresh control not refreshing after viewIsAppearing called")

        // Act
        loader.completeRequest(products: [])
        
        // Assert
        XCTAssertFalse(sut.isShowingProductLoadingIndicator, "Expected loading indicator not visible after request completed")
        XCTAssertFalse(sut.isRefreshControlRefreshing, "Expected refresh control not refreshing after request ocmpleted")

        // Act
        sut.simulateUserInitiatedRefresh()
        
        // Assert
        XCTAssertFalse(sut.isShowingProductLoadingIndicator, "Expected loading indicator not visible on user initiated refresh")
        XCTAssertTrue(sut.isRefreshControlRefreshing, "Expected refresh control refreshing on user initiated refresh")
        
        // Act
        loader.completeRequest(products: [])
        
        // Assert
        XCTAssertFalse(sut.isShowingProductLoadingIndicator, "Expected loading indicator not visible after request completed")
        XCTAssertFalse(sut.isRefreshControlRefreshing, "Expected refresh control not refreshing after request ocmpleted")
    }
    
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
        var completions: [ProductStore.Completion] = []
        var requestCount: Int {
            completions.count
        }
        
        func completeRequest(at index: Int = 0, products: [Product]) {
            completions[index](products)
        }
        
        func loadProducts(completion: @escaping Completion) {
            completions.append(completion)
        }
    }
}


