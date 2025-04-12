//
//  ProgressButton.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 12/04/25.
//

import UIKit

public class ProgressButton: UIView {
    let button: UIButton = UIButton()
    
    public init(title: String, titleColor: UIColor) {
        super.init(frame: .zero)
        configureUI(title: title,
                    titleColor: titleColor)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Helper
    private func configureUI(title: String,
                             titleColor: UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for: .normal)
    }
    
    // MARK: - Test Specific
    public func buttonTitle(for state: UIControl.State) -> String? {
        button.title(for: .normal)
    }
    
    public func buttonTitleColor(for state: UIControl.State) -> UIColor? {
        button.titleColor(for: .normal)
    }
}
