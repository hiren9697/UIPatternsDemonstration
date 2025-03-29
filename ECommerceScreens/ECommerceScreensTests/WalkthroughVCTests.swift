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
    
    private func assert(sut: WalkthroughVC,
                        isRendering items: [WalkthroughItem],
                        file: StaticString = #file,
                        line: UInt = #line) {
        XCTAssertEqual(sut.numberOfRenderedItems,
                       items.count,
                       "Expected walkthrough to render \(items.count) items, But it rendered \(sut.numberOfRenderedItems) items",
                       file: file,
                       line: line)
        
        for (index, item) in items.enumerated() {
            assert(sut: sut,
                   configured: item,
                   at: index,
                   file: file,
                   line: line)
        }
    }
    
    private func assert(sut: WalkthroughVC,
                        configured item: WalkthroughItem,
                        at index: Int,
                        file: StaticString = #filePath,
                        line: UInt = #line) {
        guard let view = sut.simulateWalkthroughItemVisible(at: index) else {
            return XCTFail("Expected non-nil view at: \(index), but got nil instead",
                           file: file,
                           line: line)
        }
        XCTAssertEqual(view.imageView.image,
                       item.image,
                       "Expected view at: \(index) to have image: \(item.image), but got \(String(describing: view.imageView.image)) instead",
                       file: file,
                       line: line)
        XCTAssertEqual(view.titleLabel.text,
                       item.title,
                       "Expected view at: \(index) to have title text: '\(item.title)', but got '\(String(describing: view.titleLabel.text))' instead",
                       file: file,
                       line: line)
        XCTAssertEqual(view.subtitleLabel.text,
                       item.subtitle,
                       "Expected view at: \(index), to have subtitle text: '\(item.subtitle)', but got '\(String(describing: view.subtitleLabel.text))' instead",
                       file: file,
                       line: line)
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


