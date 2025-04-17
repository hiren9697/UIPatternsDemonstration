//
//  ProgressButton.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 12/04/25.
//

import XCTest
import ECommerceScreens

final class ProgressButtonTests: XCTestCase {
    func test_attributes_areConfigured() {
        // Arrange & Act
        let title: String = "Test Title"
        let titleColor: UIColor = AppColors.cFFFFFF
        let backgroundColor: UIColor = AppColors.cF83758
        let sut = makeSUT(title: title, titleColor: titleColor, backgroundColor: backgroundColor)
        
        // Assert
        XCTAssertEqual(sut.buttonTitle(for: .normal),
                       title,
                       "Expected title: \(title), but got \(String(describing: sut.buttonTitle(for: .normal))) instead")
        XCTAssertEqual(sut.buttonTitleColor(for: .normal),
                       titleColor,
                       "Expected titleColor: \(titleColor), but got \(String(describing: sut.buttonTitleColor(for: .normal))) instead")
        XCTAssertEqual(sut.containerViewBackgroundColor(),
                       backgroundColor,
                       "Expected background color: \(backgroundColor), but got \(String(describing: sut.containerViewBackgroundColor())) instead")
        XCTAssertEqual(sut.buttonBackgroundColor,
                       UIColor.clear,
                       "Expected button background color to be clear, but got \(String(describing: sut.buttonBackgroundColor)) instead")
        XCTAssertEqual(sut.progressColor,
                       titleColor,
                       "Expected progress color \(titleColor), but got \(String(describing: sut.progressColor)) instead")
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
    
    func test_showProgress_hidesButtonAndShowsProgress() {
        // Arrange
        let sut = makeSUT()
        
        // Assert
        checkProgressVisible(sut: sut, expectedProgressVisibility: false)
        
        // Act
        sut.showProgress()
        
        // Assert
        checkProgressVisible(sut: sut, expectedProgressVisibility: true)
    }
    
    func test_hideProgress_showsButtonAndHidesProgress() {
        // Arrange
        let sut = makeSUT()
        
        // Act
        sut.showProgress()
        
        // Assert
        checkProgressVisible(sut: sut, expectedProgressVisibility: true)
        
        // Act
        sut.hideProgress()
        
        // Assert
        checkProgressVisible(sut: sut, expectedProgressVisibility: false)
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
    
    private func checkProgressVisible(sut: ProgressButton,
                                      expectedProgressVisibility: Bool,
                                      file: StaticString = #filePath,
                                      line: UInt = #line) {
        let expectedButtonVisibility: Bool = !expectedProgressVisibility
        // Assert
        XCTAssertEqual(sut.isButtonVisible,
                       expectedButtonVisibility,
                       "Expected button visibility: \(expectedButtonVisibility), but got: \(sut.isButtonVisible) instedad",
                       file: file,
                       line: line)
        XCTAssertEqual(sut.isProgressVisible,
                       expectedProgressVisibility,
                       "Expected progress visibility: \(expectedProgressVisibility), but got: \(sut.isProgressVisible) instedad",
                       file: file,
                       line: line)
    }

}
