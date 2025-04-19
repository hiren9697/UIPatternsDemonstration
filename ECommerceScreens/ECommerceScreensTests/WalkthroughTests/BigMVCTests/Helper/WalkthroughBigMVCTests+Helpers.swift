//
//  WalkthroughVCTests+Helpers.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import XCTest
@testable import ECommerceScreens

func assert(sut: WTBasicMVCWalkthroughViewController,
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
    
    func assert(sut: WTBasicMVCWalkthroughViewController,
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
