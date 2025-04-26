//
//  PRSortViewTests.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 22/04/25.
//

import XCTest
import ECommerceScreens

class PRSortViewTests: XCTestCase {
    func test_present_addsSortViewInParentView() {
        // Arrange & Act
        let parentView = UIView()
        let sut = makeSUT(parentView: parentView)

        // Assert
        XCTAssertEqual(sut.superview, parentView)
    }
    
    func test_clickOnBackView_dismisses() {
        // Arrange
        let parentView = UIView()
        let sut = makeSUT(parentView: parentView)
        XCTAssertNotNil(sut.superview, "Precondition: PRSortView must be added to a parent view")
        
        // Act
        sut.simulateBackgroundTap()
        
        // Assert
        XCTAssertNil(sut.superview)
    }
    
    func test_selectedOption_isNotConfigured_whenGivenNilValue() {
        // Arrange & Act
        let sut = makeSUT()
        
        // Assert
        XCTAssertNil(sut.selectedOption)
    }
    
    func test_selectedOption_isConfigured_whenGivenNonNilValue() {
        // Arrange & Act
        let option: PRSortOption = PRSortOption.highToLow
        let sut = makeSUT(selectedOption: option)
        
        // Assert
        XCTAssertEqual(sut.selectedOption, option)
    }
    
    func test_clickOnBackView_doesNotCallCompletion() {
        // Arrange
        var completionCalls: [PRSortOption?] = []
        let sut = makeSUT(completion: { selectedSortOption in completionCalls.append(selectedSortOption) })
        
        // Act
        sut.simulateBackgroundTap()
        
        // Assert
        XCTAssertEqual(completionCalls, [])
    }
    
    func test_choosingHighToLowPrice_completesWithHighToLow() {
        // Arrange
        var completions: [PRSortOption?] = []
        let sut = makeSUT(completion: { completions.append($0) })
        
        // Act
        sut.simulateHighToLowPriceTap()
        
        // Assert
        XCTAssertEqual(completions, [PRSortOption.highToLow])
    }
    
    func test_choosingLowToHighPrice_completesWithLowToHigh() {
        // Arrange
        var completions: [PRSortOption?] = []
        let sut = makeSUT(completion: { completions.append($0) })
        
        // Act
        sut.simulateLowToHighPriceTap()
        
        // Assert
        XCTAssertEqual(completions, [PRSortOption.lowToHigh])
    }
    
    func test_choosingLowToHighPriceOption_dismisses() {
        // Arrange
        let parentView = UIView()
        let sut = makeSUT(parentView: parentView)
        XCTAssertNotNil(sut.superview, "Precondition: PRSortView must be added to a parent view")
        
        // Act
        sut.simulateLowToHighPriceTap()
        
        // Assert
        XCTAssertNil(sut.superview)
    }
    
    func test_choosingHighToLowPriceOption_dismisses() {
        // Arrange
        let parentView = UIView()
        let sut = makeSUT(parentView: parentView)
        XCTAssertNotNil(sut.superview, "Precondition: PRSortView must be added to a parent view")
        
        // Act
        sut.simulateHighToLowPriceTap()
        
        // Assert
        XCTAssertNil(sut.superview)
    }
    
    // MARK: - Helper
    private func makeSUT(parentView: UIView = UIView(),
                         selectedOption: PRSortOption? = nil,
                         completion: @escaping PRSortView.Completion = { _ in },
                         file: StaticString = #filePath,
                         line: UInt = #line) -> PRSortView {
        let sortView = PRSortViewComposer.compose(selectedSortOption: selectedOption,
                                                  parentView: parentView,
                                                  completion: completion)
        trackMemory(for: parentView, file: file, line: line)
        trackMemory(for: sortView, file: file, line: line)
        return sortView
    }
}
