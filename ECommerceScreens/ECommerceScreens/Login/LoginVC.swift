//
//  LoginVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class LoginVC: UIViewController {
    let welcomeLabel: UILabel = UILabel()
    lazy var emailField: InputFieldView = {
        InputFieldView(iconImage: UIImage(namedWithInBundle: "ic_mail")!,
                       placeholder: "Email",
                       keyboardType: .emailAddress,
                       returnKeyType: .next,
                       isSecureTextEntry: false,
                       onReturn: {[weak self] in
            self?.passwordField.makeInputFirstResponder()
            return true
        })
    }()
    lazy var passwordField: InputFieldView = {
        InputFieldView(iconImage: UIImage(namedWithInBundle: "ic_password")!,
                       placeholder: "Password",
                       keyboardType: .asciiCapable,
                       returnKeyType: .done,
                       isSecureTextEntry: true,
                       onReturn: {[weak self] in
            self?.passwordField.makeInputRsignResponder()
            return true
        })
    }()
    lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.addTarget(self, action: #selector(forgotPasswordTap), for: .touchUpInside)
        return button
    }()
    
    let onForgotPasswordTap: () -> Void
    
    public init(onForgotPasswordTap: @escaping () -> Void) {
        self.onForgotPasswordTap = onForgotPasswordTap
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("LoginVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUI()
        layoutUIComponents()
    }
    
    @objc func forgotPasswordTap() {
        onForgotPasswordTap()
    }
    
    // MARK: - UI Helper
    private func configureInitialUI() {
        view.backgroundColor = .white
        
        welcomeLabel.text = "Welcome\nBack!"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 36)
        welcomeLabel.textColor = AppColors.c000000
    }
    
    private func layoutUIComponents() {
        view.addSubview(emailField)
        view.addSubview(passwordField)
    }
}
