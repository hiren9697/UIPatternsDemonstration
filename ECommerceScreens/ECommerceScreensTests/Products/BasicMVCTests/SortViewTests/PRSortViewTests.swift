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
    private func makeSUT(file: StaticString = #filePath,
                         line: UInt = #line) -> (PRSortView, UIViewController) {
        let viewController = UIViewController()
        let sortView = PRSortView.present(in: viewController.view)
        trackMemory(for: viewController, file: file, line: line)
        trackMemory(for: sortView, file: file, line: line)
        return (sortView, viewController)
    }
}
