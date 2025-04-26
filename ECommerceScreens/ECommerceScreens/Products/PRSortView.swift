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
    private let hightToLowSortOptionView: PRSortOptionView
    private let lowToHighSortOptionView: PRSortOptionView
    
    public init(selectedOption: PRSortOption?, completion: @escaping (PRSortOption?) -> Void) {
        self.hightToLowSortOptionView = PRSortOptionView(type: .highToLow,
                                                         isSelected: selectedOption == PRSortOption.highToLow,
                                                         completion: { _ in
            completion(.highToLow)
        })
        self.lowToHighSortOptionView = PRSortOptionView(type: .lowToHigh,
                                                        isSelected: selectedOption == PRSortOption.lowToHigh,
                                                        completion: { _ in
            completion(.lowToHigh)
        })
        super.init(frame: .zero)
        configureInitialUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static func present(in parentView: UIView,
                               withSelectedOption option: PRSortOption?,
                               completion: @escaping Completion) -> PRSortView {
        let sortView = PRSortView(selectedOption: option, completion: completion)
        sortView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(sortView)
//        sortView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
//        sortView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
//        sortView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
//        sortView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        return sortView
    }
    
    private func configureInitialUI() {
        backgroundButton.addTarget(self, action: #selector(handleBackgroundButtonTap), for: .touchUpInside)
    }
    
    @objc func handleBackgroundButtonTap() {
        self.removeFromSuperview()
    }
    
    // MARK: - Test Properties
    public var selectedOption: PRSortOption? {
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
        hightToLowSortOptionView.simulateClick()
    }
    public func simulateLowToHighPriceTap() {
        lowToHighSortOptionView.simulateClick()
    }
}
