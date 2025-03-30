//
//  WalkthroughVCTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import XCTest
@testable import ECommerceScreens

final class WalkthroughVCTests: XCTestCase {
    func test_walkthroughItems_rendered_1() {
        // Arrange & Act
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        
        // Assert
        assert(sut: sut, isRendering: items)
    }
    
    func test_walkthroughItems_rendered_2() {
        // Arrange & Act
        let items = getDummyItems(5)
        let sut = makeSUT(items: items)
        
        // Assert
        assert(sut: sut, isRendering: items)
    }
    
    func test_pageIndicator_hasSameNumberOfPages_asItems_1() {
        // Arrange & Act
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorTotalPages, items.count)
    }
    
    func test_pageIndicator_hasSameNumberOfPages_asItems_2() {
        // Arrange & Act
        let items = getDummyItems(5)
        let sut = makeSUT(items: items)
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorTotalPages, items.count)
    }
    
    func test_pageIndicator_updatesCurrentPage_onScrollingItems() {
        // Note: To have visible cells on collectionView, collectionView should be subView of view, and should have valid frame(It can be with constraint), and neet to call `layoutIfNeeded()` on collectionView, But now we are not showing collectionView cells on screen, we are just updating content offset of collectionview
        
        // Arrange
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        // This is needed to have visible cells on collectionView
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorCurrentPage,
                       0,
                       "Expected currentPage to be 0 initially, but got \(sut.pageIndicatorCurrentPage) instead")
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorCurrentPage,
                       1,
                       "Expected currentPage to be 1 after scrolling to next item, but got \(sut.pageIndicatorCurrentPage) instead")
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorCurrentPage,
                       2,
                       "Expected currentPage to be 2 after second scroll, but got \(sut.pageIndicatorCurrentPage) instead")
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorCurrentPage,
                       2,
                       "Expected currentPage to be 2 after third scroll, because there is no next item, but got \(sut.pageIndicatorCurrentPage) instead")
    }
    
    // MARK: - Helper
    private func getDummyItems(_ itemCount: Int) -> [WalkthroughItem] {
        let colors: [UIColor] = [.red, .blue, .green, .yellow, .orange]
        var items: [WalkthroughItem] = []
        for i in 1 ... itemCount {
            let imageColorIndex: Int = i % 5
            let imageColor = colors[imageColorIndex]
            let item = WalkthroughItem(image: UIImage.make(withColor: imageColor),
                                       title: "Title no. \(i)",
                                       subtitle: "Subtitle no. \(i)")
            items.append(item)
        }
        return items
    }
    
    private func makeSUT(items: [WalkthroughItem]) -> WalkthroughVC {
        let vc = WalkthroughVC(items: items)
        vc.loadViewIfNeeded()
        trackMemory(for: vc)
        return vc
    }
    
    private func trackMemory(for object: AnyObject,
                             file: StaticString = #filePath,
                             line: UInt = #line) {
        addTeardownBlock {[weak object] in
            XCTAssertNil(object,
                         "Instance should have been deallocated. Potential memory leak: \(String(describing: object))",
                         file: file,
                         line: line)
        }
    }
}


