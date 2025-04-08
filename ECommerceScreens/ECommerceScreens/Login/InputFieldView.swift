//
//  InputContainerView.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class InputFieldView: UIView, UITextFieldDelegate {
    public typealias OnReturn = () -> Bool
    let iconImageView: UIImageView = UIImageView()
    let textField: UITextField = UITextField()
    let passwordVisibility: UIButton = UIButton()
    let onReturn: OnReturn
    var onLayoutSubViews: (() -> Void)?
    
    public init(iconImage: UIImage,
                placeholder: String,
                keyboardType: UIKeyboardType,
                returnKeyType: UIReturnKeyType,
                isSecure: Bool,
                onReturn: @escaping OnReturn) {
        self.onReturn = onReturn
        super.init(frame: .zero)
        configureUI(iconImage: iconImage,
                    placeholder: placeholder,
                    keyboardType: keyboardType,
                    returnKeyType: returnKeyType,
                    isSecure: isSecure)
        onLayoutSubViews = {[weak self] in
            self?.layoutUIcomponents()
            self?.onLayoutSubViews = nil
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("LoginVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        onLayoutSubViews?()
    }
    
    // MARK: - Helper
    private func configureUI(iconImage: UIImage,
                             placeholder: String,
                             keyboardType: UIKeyboardType,
                             returnKeyType: UIReturnKeyType,
                             isSecure: Bool) {
        iconImageView.image = iconImage
        textField.placeholder = placeholder
        textField.keyboardType = keyboardType
        textField.returnKeyType = returnKeyType
        textField.isSecureTextEntry = isSecure
        passwordVisibility.isHidden = !isSecure
        passwordVisibility.setImage(UIImage(named: "ic_show_password",
                                            in: Bundle(identifier: "hiren.ECommerceScreens"),
                                            with: nil),
                                    for: .normal)
        passwordVisibility.addTarget(self, action: #selector(passwordVisibilityTap), for: .touchUpInside)
        textField.delegate = self
    }
    
    private func layoutUIcomponents() {
        let containerView = UIView()
        containerView.backgroundColor = AppColors.cF3F3F3
        containerView.layer.borderColor = AppColors.cA8A8A9.cgColor
        containerView.layer.borderWidth = 1
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        
        iconImageView.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)
        textField.setContentHuggingPriority(UILayoutPriority(250), for: .horizontal)
        passwordVisibility.setContentHuggingPriority(UILayoutPriority(251), for: .horizontal)

        let stackView = UIStackView(arrangedSubviews: [iconImageView, textField, passwordVisibility])
        stackView.axis = .horizontal
        stackView.spacing = 5
        stackView.alignment = .center
        stackView.distribution = .fill
        containerView.addSubview(stackView)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 11).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -11).isActive = true
        stackView.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    @objc func passwordVisibilityTap() {
        textField.isSecureTextEntry.toggle()
        guard let showPasswordImage = UIImage(named: "ic_show_password",
                                              in: Bundle(identifier: "hiren.ECommerceScreens"),
                                              with: nil) else {
            return
        }
        guard let hidePasswordImage = UIImage(named: "ic_hide_password",
                                              in: Bundle(identifier: "hiren.ECommerceScreens"),
                                              with: nil) else {
            return
        }
        let image = textField.isSecureTextEntry ? showPasswordImage : hidePasswordImage
        passwordVisibility.setImage(image, for: .normal)
    }
    
    // MARK: - Public Interface
    func makeInputFirstResponder() {
        textField.becomeFirstResponder()
    }
    
    func makeInputRsignResponder() {
        textField.resignFirstResponder()
    }
    
    // MARK: - TextField Delegate
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        onReturn()
    }
}
