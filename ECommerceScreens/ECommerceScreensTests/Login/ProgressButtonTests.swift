//
//  ProgressButton.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 12/04/25.
//

import XCTest
import ECommerceScreens

final class ProgressButtonTests: XCTestCase {
    func test_title_isConfigured() {
        // Arrange & Act
        let title: String = "Test Title"
        let sut = makeSUT(title: title)
        
        // Assert
        XCTAssertEqual(sut.buttonTitle(for: .normal), title)
    }
    
    func test_titleColor_isConfigured() {
        // Arrange & Act
        let titleColor: UIColor = AppColors.cFFFFFF
        let sut = makeSUT(titleColor: titleColor)
        
        // Assert
        XCTAssertEqual(sut.buttonTitleColor(for: .normal), titleColor)
    }
    
    func test_backgroundColor_isConfigured() {
        // Arrange & Act
        let backgroundColor: UIColor = AppColors.cF83758
        let sut = makeSUT(backgroundColor: backgroundColor)
        
        // Assert
        XCTAssertEqual(sut.containerViewBackgroundColor(), backgroundColor)
    }
    
    func test_buttonClick_callsOnClick() {
        // Arrange
        var buttonClicks: [Bool] = []
        let sut = makeSUT(onClick: { buttonClicks.append(true) })
        
        // Act
        sut.simulateButtonClick()
        
        // Assert
        XCTAssertEqual(buttonClicks, [true])
    }
    
    func test_buttonClick_hidesTitleAndShowsProgress() {
        
        
    }
    
    // MARK: - Helper
    private func makeSUT(title: String = "Test Title",
                         titleColor: UIColor = UIColor.white,
                         backgroundColor: UIColor = UIColor.black,
                         onClick: @escaping () -> Void = {},
                         file: StaticString = #filePath,
                         line: UInt = #line) -> ProgressButton {
        let sut = ProgressButton(title: title,
                                 titleColor: titleColor,
                                 backgroundColor: backgroundColor,
                                 onClick: onClick)
        trackMemory(for: sut,
                    file: file,
                    line: line)
        return sut
    }

}
