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
        let (sut, viewController) = makeSUT()

        // Assert
        XCTAssertEqual(sut.superview, viewController.view)
    }
    
    func test_clickOnBackView_dismisses() {
        // Arrange
        let (sut, _) = makeSUT()
        
        // Act
        sut.simulateBackgroundTap()
        
        // Assert
        XCTAssertNil(sut.superview)
    }
    
    func test_selectedOption_isNotConfigured_whenGivenNilValue() {
        // Arrange & Act
        let (sut, _) = makeSUT()
        
        // Assert
        XCTAssertNil(sut.selectedOption)
    }
    
    func test_selectedOption_isConfigured_whenGivenNonNilValue() {
        // Arrange & Act
        let option: PRSortOption = PRSortOption.highToLow
        let (sut, _) = makeSUT(selectedOption: option)
        
        // Assert
        XCTAssertEqual(sut.selectedOption, option)
    }
    
    func test_clickOnBackView_doesNotCallCompletion() {
        // Arrange
        var completionCalls: [PRSortOption?] = []
        let (sut, _) = makeSUT(completion: { selectedSortOption in completionCalls.append(selectedSortOption) })
        
        // Act
        sut.simulateBackgroundTap()
        
        // Assert
        XCTAssertEqual(completionCalls, [])
    }
    
//    func test_chossingHighToLowPrice_completesWithHighToLow() {
//        // Arrange
//        var completions: [PRSortOption] = []
//        let (sut, _) = makeSUT(completion: { completions.append($0) })
//        
//        // Act
//        sut.simulateHighToLowPricesTap()
//        
//        // Assert
//        XCTAssertEqual(completions, [PRSortOption.highToLow])
//    }
    
    // MARK: - Helper
    private func makeSUT(selectedOption: PRSortOption? = nil,
                         completion: @escaping PRSortView.Completion = { _ in },
                         file: StaticString = #filePath,
                         line: UInt = #line) -> (PRSortView, UIViewController) {
        let viewController = UIViewController()
        let sortView = PRSortView.present(in: viewController.view,
                                          withSelectedOption: selectedOption,
                                          completion: completion)
        trackMemory(for: viewController, file: file, line: line)
        trackMemory(for: sortView, file: file, line: line)
        return (sortView, viewController)
    }
}
