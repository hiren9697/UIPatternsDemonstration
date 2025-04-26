//
//  PRSortView.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 22/04/25.
//

import UIKit

public class PRSortView: UIView {
    public typealias Completion = (PRSortOption?) -> Void
    private let shouldAnimate: Bool
    private let containerView: UIView = UIView()
    private let backgroundView: UIView = UIView()
    private let backgroundButton: UIButton = UIButton()
    private let optionContainerView: UIView = UIView()
    private let bottomSafeAreaView: UIView = UIView()
    private var sortOptionBottomConstraint: NSLayoutConstraint?
    var hightToLowSortOptionView: PRSortOptionView?
    var lowToHighSortOptionView: PRSortOptionView?
    
    public init(shouldAnimate: Bool) {
        self.shouldAnimate = shouldAnimate
        super.init(frame: .zero)
        configureInitialUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureInitialUI() {
        backgroundButton.addTarget(self, action: #selector(handleBackgroundButtonTap), for: .touchUpInside)
        backgroundView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
        backgroundButton.backgroundColor = UIColor.clear
        bottomSafeAreaView.backgroundColor = .white
    }
    
    func setupConstraints() {
        guard let lowToHighSortOptionView = lowToHighSortOptionView,
              let hightToLowSortOptionView = hightToLowSortOptionView
        else {
            fatalError("Component is not initialized properly")
        }
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(backgroundView)
        backgroundView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        backgroundView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        backgroundButton.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.addSubview(backgroundButton)
        backgroundButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor).isActive = true
        backgroundButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor).isActive = true
        backgroundButton.topAnchor.constraint(equalTo: backgroundView.topAnchor).isActive = true
        backgroundButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor).isActive = true
        
        let separatorView = UIView()
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.backgroundColor = .systemGray6
        separatorView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [lowToHighSortOptionView, separatorView, hightToLowSortOptionView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.spacing = 0
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.alignment = .fill
        
        optionContainerView.backgroundColor = .white
        optionContainerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(optionContainerView)
        optionContainerView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        optionContainerView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        sortOptionBottomConstraint = optionContainerView.bottomAnchor.constraint(equalTo: containerView.safeAreaLayoutGuide.bottomAnchor)
        sortOptionBottomConstraint?.isActive = true

        optionContainerView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: optionContainerView.leadingAnchor, constant: 0).isActive = true
        stackView.trailingAnchor.constraint(equalTo: optionContainerView.trailingAnchor, constant: 0).isActive = true
        stackView.topAnchor.constraint(equalTo: optionContainerView.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(equalTo: optionContainerView.bottomAnchor, constant: 0).isActive = true
        
        bottomSafeAreaView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(bottomSafeAreaView)
        bottomSafeAreaView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        bottomSafeAreaView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        bottomSafeAreaView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor).isActive = true
        bottomSafeAreaView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
    @objc func handleBackgroundButtonTap() {
        dismiss()
    }
    
    func dismiss() {
        animateOut()
    }
    
    public func animateIn() {
        guard shouldAnimate else {
            return
        }
        layoutIfNeeded()
        backgroundView.alpha = 0
        sortOptionBottomConstraint?.constant = optionContainerView.bounds.height
        layoutIfNeeded()
        UIView.animate(withDuration: 0.25,
                       animations: {[weak self] in
            self?.backgroundView.alpha = 1
            self?.sortOptionBottomConstraint?.constant = 0
            self?.layoutIfNeeded()
        })
    }
    
    func animateOut() {
        guard shouldAnimate else {
            return removeFromSuperview()
        }
        UIView.animate(withDuration: 0.25,
                       animations: {[weak self] in
            guard let self = self else { return }
            self.backgroundView.alpha = 0
            self.sortOptionBottomConstraint?.constant = self.optionContainerView.bounds.height
            self.layoutIfNeeded()
        }, completion: {[weak self] _ in
            self?.removeFromSuperview()
        })
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
