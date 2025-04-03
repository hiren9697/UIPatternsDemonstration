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
        // Arrange
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        /// Why do we need `layoutIfNeeded` ?
        /// Initially we used method: `simulateScrollToNextItemByUpdatingOffset` which was updating offset of collection instead of making collectionView to scrolll to an item, Without calling this collectionView's width would be 0, so it doesn't work if collectionView is not layed out properly
        /// Now we are scrolling to actual item by calling helper method `simulateScrollToNextItem`, In this case there would be no visible items without calling this method, so helper method `simulateScrollToNextItem`, couldn't complete properly as it needs visible items
        /// So in both the cases we need to call `layoutIfNeeded`
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorCurrentPage,
                       0,
                       "Expected currentPage to be 0 initially, but got \(sut.pageIndicatorCurrentPage) instead")
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorCurrentPage,
                       1,
                       "Expected currentPage to be 1 after scrolling to next item, but got \(sut.pageIndicatorCurrentPage) instead")
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)

        // Assert
        XCTAssertEqual(sut.pageIndicatorCurrentPage,
                       2,
                       "Expected currentPage to be 2 after second scroll, but got \(sut.pageIndicatorCurrentPage) instead")
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)

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
        /// Why do we need `layoutIfNeeded` ?
        /// Initially we used method: `simulateScrollToNextItemByUpdatingOffset` which was updating offset of collection instead of making collectionView to scrolll to an item, Without calling this collectionView's width would be 0, so it doesn't work if collectionView is not layed out properly
        /// Now we are scrolling to actual item by calling helper method `simulateScrollToNextItem`, In this case there would be no visible items without calling this method, so helper method `simulateScrollToNextItem`, couldn't complete properly as it needs visible items
        /// So in both the cases we need to call `layoutIfNeeded`
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        let trackingTextForFirstItem = getTrackingText(for: 0)
        XCTAssertEqual(sut.currentItemTrackingText,
                       trackingTextForFirstItem,
                       "Expected current item trakcing text to be '\(trackingTextForFirstItem)' initially, but got \(sut.currentItemTrackingText) instead")
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)
        
        // Assert
        let trackingTextforSecondItem = getTrackingText(for: 1)
        XCTAssertEqual(sut.currentItemTrackingText,
                       trackingTextforSecondItem,
                       "Expected current item trakcing text to be '\(trackingTextforSecondItem)' after first scroll, but got \(sut.currentItemTrackingText) instead")
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)
        
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
        /// Why do we need `layoutIfNeeded` ?
        /// Initially we used method: `simulateScrollToNextItemByUpdatingOffset` which was updating offset of collection instead of making collectionView to scrolll to an item, Without calling this collectionView's width would be 0, so it doesn't work if collectionView is not layed out properly
        /// Now we are scrolling to actual item by calling helper method `simulateScrollToNextItem`, In this case there would be no visible items without calling this method, so helper method `simulateScrollToNextItem`, couldn't complete properly as it needs visible items
        /// So in both the cases we need to call `layoutIfNeeded`
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertTrue(sut.previousButton.isHidden)
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertFalse(sut.previousButton.isHidden)
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)

        // Assert
        XCTAssertFalse(sut.previousButton.isHidden)
        
        // Act
        sut.simulateScrollToPreviousItem()
        sut.simulateScrollToPreviousItem()
        
        // Assert
        XCTAssertTrue(sut.previousButton.isHidden)
    }
    
    func test_nexButton_updatesText_onScrollToLastItem() {
        // Arrange & Act
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        /// Why do we need `layoutIfNeeded` ?
        /// Initially we used method: `simulateScrollToNextItemByUpdatingOffset` which was updating offset of collection instead of making collectionView to scrolll to an item, Without calling this collectionView's width would be 0, so it doesn't work if collectionView is not layed out properly
        /// Now we are scrolling to actual item by calling helper method `simulateScrollToNextItem`, In this case there would be no visible items without calling this method, so helper method `simulateScrollToNextItem`, couldn't complete properly as it needs visible items
        /// So in both the cases we need to call `layoutIfNeeded`
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertEqual(sut.nextButtonText,
                       "Next",
                       "Expected text of next button: 'Next' on first item, but got '\(sut.nextButtonText)'")
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)
        
        // Assert
        XCTAssertEqual(sut.nextButtonText,
                       "Next",
                       "Expected text of next button: 'Next' on second item, but got '\(sut.nextButtonText)'")
        
        // Act
        sut.simulateScrollToNextItem(totalItemCount: items.count)

        // Assert
        XCTAssertEqual(sut.nextButtonText,
                       "Get Started",
                       "Expected text of next button: 'Get Started' on third / last item, but got '\(sut.nextButtonText)'")
    }
    
    func test_previousButton_scrollsToPreviousItem() {
        // Arrange & Act
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        /// Why do we need `layoutIfNeeded` ?
        /// Initially we used method: `simulateScrollToNextItemByUpdatingOffset` which was updating offset of collection instead of making collectionView to scrolll to an item, Without calling this collectionView's width would be 0, so it doesn't work if collectionView is not layed out properly
        /// Now we are scrolling to actual item by calling helper method `simulateScrollToNextItem`, In this case there would be no visible items without calling this method, so helper method `simulateScrollToNextItem`, couldn't complete properly as it needs visible items
        /// So in both the cases we need to call `layoutIfNeeded`
        sut.collectionView.layoutIfNeeded()
        sut.simulateScrollToNextItem(totalItemCount: items.count)
        sut.simulateScrollToNextItem(totalItemCount: items.count)
        
        XCTAssertEqual(sut.visibleItemIndex,
                       2,
                       "Expected third item visible on screen, but got \(String(describing: sut.visibleItemIndex)) instead")
        
        sut.simulatePreviousButtonTap()
        sut.collectionView.layoutIfNeeded()
        
        XCTAssertEqual(sut.visibleItemIndex,
                       1,
                       "Expected second item visible on screen, but got \(String(describing: sut.visibleItemIndex)) instead")
        
        sut.simulatePreviousButtonTap()
        sut.collectionView.layoutIfNeeded()
        
        XCTAssertEqual(sut.visibleItemIndex,
                       0,
                       "Expected first item visible on screen, but got \(String(describing: sut.visibleItemIndex)) instead")
        
        sut.simulatePreviousButtonTap()
        sut.collectionView.layoutIfNeeded()
        
        XCTAssertEqual(sut.visibleItemIndex,
                       0,
                       "Expected first item visible on screen, but got \(String(describing: sut.visibleItemIndex)) instead")
        
    }
    
    func test_nextButton_scrollsToNextItem() {
        // Arrange & Act
        let items = getDummyItems(3)
        let sut = makeSUT(items: items)
        /// Why do we need `layoutIfNeeded` ?
        /// Initially we used method: `simulateScrollToNextItemByUpdatingOffset` which was updating offset of collection instead of making collectionView to scrolll to an item, Without calling this collectionView's width would be 0, so it doesn't work if collectionView is not layed out properly
        /// Now we are scrolling to actual item by calling helper method `simulateScrollToNextItem`, In this case there would be no visible items without calling this method, so helper method `simulateScrollToNextItem`, couldn't complete properly as it needs visible items
        /// So in both the cases we need to call `layoutIfNeeded`
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertEqual(sut.visibleItemIndex,
                       0,
                       "Expected first item visible on screen initially, but got \(String(describing: sut.visibleItemIndex)) instead")
        
        // Act
        sut.simulateNextButtonTap()
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertEqual(sut.visibleItemIndex,
                       1,
                       "Expected second item visible on screen after tapping next button, but got \(String(describing: sut.visibleItemIndex)) instead")
        
        // Act
        sut.simulateNextButtonTap()
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertEqual(sut.visibleItemIndex,
                       2,
                       "Expected third item visible on screen after tapping next button, but got \(String(describing: sut.visibleItemIndex)) instead")
        
        // Act
        sut.simulateNextButtonTap()
        sut.collectionView.layoutIfNeeded()
        
        // Assert
        XCTAssertEqual(sut.visibleItemIndex,
                       2,
                       "Expected third item visible on screen after tapping next button, but got \(String(describing: sut.visibleItemIndex)) instead")
    }
    
    func test_nextButton_navigatesToNextScreen_onLastItem() {
        // Arrange & Act
        let items = getDummyItems(3)
        var isFinishWalkthroughCalled = false
        let sut = makeSUT(items: items, onFinishWalkthrough: { isFinishWalkthroughCalled = true })
        /// Why do we need `layoutIfNeeded` ?
        /// Initially we used method: `simulateScrollToNextItemByUpdatingOffset` which was updating offset of collection instead of making collectionView to scrolll to an item, Without calling this collectionView's width would be 0, so it doesn't work if collectionView is not layed out properly
        /// Now we are scrolling to actual item by calling helper method `simulateScrollToNextItem`, In this case there would be no visible items without calling this method, so helper method `simulateScrollToNextItem`, couldn't complete properly as it needs visible items
        /// So in both the cases we need to call `layoutIfNeeded`
        sut.collectionView.layoutIfNeeded()
        
        // Act
        sut.simulateScrollToLastItem(totalItemCount: items.count)
        sut.simulateNextButtonTap()
        
        // Assert
        XCTAssertTrue(isFinishWalkthroughCalled)
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
    
    private func makeSUT(items: [WalkthroughItem],
                         onFinishWalkthrough: @escaping () -> Void = {}) -> WalkthroughVC {
        let vc = WalkthroughVC(items: items, onFinishWalkthrough: onFinishWalkthrough)
        vc.loadViewIfNeeded()
        trackMemory(for: vc)
        return vc
    }
}


