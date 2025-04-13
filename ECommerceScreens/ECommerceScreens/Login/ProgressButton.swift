//
//  ProgressButton.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 12/04/25.
//

import UIKit

public class ProgressButton: UIView {
    private let containerView: UIView = UIView()
    private let button: UIButton = UIButton(type: .custom)
    private let activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    private let onClick: () -> Void
    private var onLayoutSubViews: (() -> Void)?
    
    public init(title: String,
                titleColor: UIColor,
                backgroundColor: UIColor,
                onClick: @escaping () -> Void) {
        self.onClick = onClick
        super.init(frame: .zero)
        configureUI(title: title,
                    titleColor: titleColor,
                    backgroundColor: backgroundColor)
        onLayoutSubViews = {[weak self] in
            self?.layoutUI()
            self?.onLayoutSubViews = nil
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        onLayoutSubViews?()
    }
    
    // MARK: - UI Helper
    private func configureUI(title: String,
                             titleColor: UIColor,
                             backgroundColor: UIColor) {
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = .medium
        activityIndicator.color = titleColor
        button.backgroundColor = UIColor.clear
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
        containerView.backgroundColor = backgroundColor
        button.addTarget(self,
                         action: #selector(buttonClick),
                         for: .touchUpInside)
    }
    
    @objc func buttonClick() {
        onClick()
    }
    
    private func layoutUI() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(button)
        button.leadingAnchor.constraint(equalTo: containerView.leadingAnchor).isActive = true
        button.trailingAnchor.constraint(equalTo: containerView.trailingAnchor).isActive = true
        button.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        button.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    }
    
    public func showProgress() {
        button.isHidden = true
        activityIndicator.startAnimating()
    }
    
    public func hideProgress() {
        button.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    // MARK: - Test Specific
    public var isButtonVisible: Bool {
        !button.isHidden
    }
    
    public var isProgressVisible: Bool {
        !activityIndicator.isHidden
    }
    
    public var buttonBackgroundColor: UIColor? {
        button.backgroundColor
    }
    
    public var progressColor: UIColor? {
        activityIndicator.color
    }
    
    public func buttonTitle(for state: UIControl.State) -> String? {
        button.title(for: .normal)
    }
    
    public func buttonTitleColor(for state: UIControl.State) -> UIColor? {
        button.titleColor(for: .normal)
    }
    
    public func containerViewBackgroundColor() -> UIColor? {
        containerView.backgroundColor
    }
    
    public func simulateButtonClick() {
        button.simulateTap()
    }
}
