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
    
    func test_currentItemTrackingLabel_updates_onScrollingItems() {
        func getTrackingText(for index: Int) -> String {
            return "\(index + 1)/\(items.count)"
        }
        // Arrange
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        let trackingTextForFirstItem = getTrackingText(for: 0)
        XCTAssertEqual(sut.currentItemTrackingText,
                       trackingTextForFirstItem,
                       "Expected current item trakcing text to be '\(trackingTextForFirstItem)' initially, but got \(sut.currentItemTrackingText) instead")
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        let trackingTextforSecondItem = getTrackingText(for: 1)
        XCTAssertEqual(sut.currentItemTrackingText,
                       trackingTextforSecondItem,
                       "Expected current item trakcing text to be '\(trackingTextforSecondItem)' after first scroll, but got \(sut.currentItemTrackingText) instead")
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        let trackingTextForThridItem = getTrackingText(for: 2)
        XCTAssertEqual(sut.currentItemTrackingText,
                       trackingTextForThridItem,
                       "Expected current item trakcing text to be '\(trackingTextForFirstItem)' after second scroll, but got \(sut.currentItemTrackingText) instead")
    }
    
    func test_previousButton_onlyVisibleAfterFirstItem() {
        // Arrange & Act
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertTrue(sut.previousButton.isHidden)
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertFalse(sut.previousButton.isHidden)
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertFalse(sut.previousButton.isHidden)
        
        // Act
        sut.scrollToPreviousItem()
        sut.scrollToPreviousItem()
        
        // Assert
        XCTAssertTrue(sut.previousButton.isHidden)
    }
    
    func test_nexButton_updatesText_onScrollToLastItem() {
        // Arrange & Act
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertEqual(sut.nextButtonText,
                       "Next",
                       "Expected text of next button: 'Next' on first item, but got '\(sut.nextButtonText)'")
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertEqual(sut.nextButtonText,
                       "Next",
                       "Expected text of next button: 'Next' on second item, but got '\(sut.nextButtonText)'")
        
        // Act
        sut.scrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertEqual(sut.nextButtonText,
                       "Get Started",
                       "Expected text of next button: 'Get Started' on third / last item, but got '\(sut.nextButtonText)'")
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


