//
//  WalkthroughVCTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import XCTest
@testable import ECommerceScreens

final class WalkthroughVCTests: XCTestCase {
    func test_walkthroughItems_rendered() {
        // Arrange & Act
        let items = getDummyItems()
        let sut = makeSUT(items: items)
        
        // Assert
        assert(sut: sut, isRendering: items)
    }
    
    func test_pageIndicator_hasSameNumberOfPages_asItems() {
        // Arrange & Act
        let items = getDummyItems()
        let sut = makeSUT(items: items)
        
        // Assert
        XCTAssertEqual(sut.pageIndicatorTotalPages, items.count)
    }
    
    // MARK: - Helper
    private func getDummyItems() -> [WalkthroughItem] {
        [
            WalkthroughItem(image: UIImage.make(withColor: .blue),
                         title: "First title",
                         subtitle: "First subtitle"),
            WalkthroughItem(image: UIImage.make(withColor: .red),
                         title: "Second title",
                         subtitle: "Second subtitle"),
            WalkthroughItem(image: UIImage.make(withColor: .yellow),
                         title: "Third title",
                         subtitle: "Third subtitle"),
            WalkthroughItem(image: UIImage.make(withColor: .green),
                         title: "Fourth title",
                         subtitle: "Fourth subtitle"),
            WalkthroughItem(image: UIImage.make(withColor: .gray),
                         title: "Fifth title",
                         subtitle: "Fifth subtitle"),
        ]
    }
    
    private func makeSUT(items: [WalkthroughItem]) -> WalkthroughVC {
        let vc = WalkthroughVC(items: items)
        vc.loadViewIfNeeded()
        return vc
    }
}


