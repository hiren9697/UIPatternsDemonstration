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
        // Arrange
        let items = getDummyItems()
        let sut = WalkthroughVC(items: items)
        
        // Act
        sut.loadViewIfNeeded()
        sut.collectionView.reloadData()
        
        // Assert
        assert(sut: sut, isRendering: items)
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
}


