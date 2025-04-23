//
//  PRSortOptionViewTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 23/04/25.
//

import XCTest
import ECommerceScreens

class PRSortOptionViewTests: XCTestCase {
    func test_title_isConfigured() {
        // Arrange & Act
        let option = PRSortOption.lowToHigh
        let sut = makeSUT(type: option)
        
        // Assert
        XCTAssertEqual(sut.titleText, option.title)
    }
    
    func test_selectionImage_isConfigured_whenNotSelected() {
        // Arrange & Act
        let sut = makeSUT(isSelected: false)
        
        // Assert
        XCTAssertEqual(sut.selectionImage, PRSortOptionState.unSelected.image)
    }
    
    func test_selectionImage_isConfigured_whenSelected() {
        // Arrange & Act
        let sut = makeSUT(isSelected: true)
        
        // Assert
        XCTAssertEqual(sut.selectionImage, PRSortOptionState.selected.image)
    }
    
    // MARK: - Helper
    private func makeSUT(type: PRSortOption = .lowToHigh,
                         isSelected: Bool = false,
                         file: StaticString = #filePath,
                         line: UInt = #line) -> PRSortOptionView {
        let sut = PRSortOptionView(type: type,
                                   isSelected: isSelected)
        trackMemory(for: sut, file: file, line: line)
        return sut
    }
}
