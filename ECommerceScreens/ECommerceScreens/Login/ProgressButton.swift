//
//  ProgressButton.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 12/04/25.
//

import UIKit

public class ProgressButton: UIView {
    private let containerView: UIView = UIView()
    private let button: UIButton = UIButton()
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
        self.addSubview(button)
    }
    
    // MARK: - Test Specific
    public var isTitleVisible: Bool? {
        guard let isHidden = button.titleLabel?.isHidden else {
            return nil
        }
        return !isHidden
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
