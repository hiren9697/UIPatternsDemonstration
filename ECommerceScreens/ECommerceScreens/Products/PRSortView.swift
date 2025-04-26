//
//  PRSortView.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 22/04/25.
//

import UIKit

public class PRSortView: UIView {
    public typealias Completion = (PRSortOption?) -> Void
    private let backgroundButton: UIButton = UIButton()
    var hightToLowSortOptionView: PRSortOptionView?
    var lowToHighSortOptionView: PRSortOptionView?
    
    public init() {
        super.init(frame: .zero)
        configureInitialUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureInitialUI() {
        backgroundButton.addTarget(self, action: #selector(handleBackgroundButtonTap), for: .touchUpInside)
    }
    
    @objc func handleBackgroundButtonTap() {
        dismiss()
    }
    
    func dismiss() {
        self.removeFromSuperview()
    }
    
    // MARK: - Test Properties
    public var selectedOption: PRSortOption? {
        guard let lowToHighSortOptionView = lowToHighSortOptionView,
              let hightToLowSortOptionView = hightToLowSortOptionView else {
            fatalError("Component is not initialized properly")
        }
        if hightToLowSortOptionView.isSelected && lowToHighSortOptionView.isSelected {
            fatalError("Both options are selected, only one option should be selected")
        }
        if hightToLowSortOptionView.isSelected {
            return .highToLow
        } else if lowToHighSortOptionView.isSelected {
            return .lowToHigh
        }
        return nil
    }
    public func simulateBackgroundTap() {
        backgroundButton.simulateTap()
    }
    public func simulateHighToLowPriceTap() {
        hightToLowSortOptionView?.simulateClick()
    }
    public func simulateLowToHighPriceTap() {
        lowToHighSortOptionView?.simulateClick()
    }
}
