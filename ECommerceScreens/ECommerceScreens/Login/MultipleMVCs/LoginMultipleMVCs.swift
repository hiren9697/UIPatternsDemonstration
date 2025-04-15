//
//  LoginMultipleMVCs.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 14/04/25.
//

import UIKit

public class LoginMultipleMVCs: UIViewController {
    public typealias ForgotPasswordCompletion = () -> Void
    public typealias LoginCompletion = () -> Void
    
    // MARK: - UI Components
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
    var loginButtonController: LoginButtonController?
    var loginButton: ProgressButton? {
        loginButtonController?.view
    }
    
    // MARK: - Variables
    let toast: Toast
    let onForgotPasswordTap: ForgotPasswordCompletion
    private let horizontalPadding: CGFloat = 32

    // MARK: - Init
    public init(toast: Toast,
                onForgotPasswordTap: @escaping ForgotPasswordCompletion) {
        self.toast = toast
        self.onForgotPasswordTap = onForgotPasswordTap
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("LoginVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    // MARK: - View Life Cycle
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUI()
        layoutUIComponents()
    }
    
    // MARK: - Button Actions
    @objc func forgotPasswordTap() {
        onForgotPasswordTap()
    }
    
    // MARK: - Helper
    func showToast(message: ToastMessage) {
        toast.present(message: message)
    }
    
    func rawInputs() -> (email: String?, password: String?) {
        (emailField.text, passwordField.text)
    }
    
    // MARK: - UI Helper
    private func configureInitialUI() {
        view.backgroundColor = .white
        
        welcomeLabel.numberOfLines = 2
        welcomeLabel.text = "Welcome\nBack!"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 36)
        welcomeLabel.textColor = AppColors.c000000
        
        forgotPasswordButton.setTitle("Forgot Password?",
                                      for: .normal)
        forgotPasswordButton.titleLabel?.font = .systemFont(ofSize: 12)
        forgotPasswordButton.setTitleColor(AppColors.cF83758,
                                           for: .normal)
        forgotPasswordButton.backgroundColor = AppColors.cFFFFFF
    }
    
    private func layoutUIComponents() {
        guard let loginButton = loginButton else {
            return
        }
        
        let scrollView = UIScrollView()
        view.addSubview(scrollView)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        
        let welcomeLabelContainer: UIView = UIView()
        welcomeLabelContainer.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabelContainer.addSubview(welcomeLabel)
        welcomeLabel.leadingAnchor.constraint(equalTo: welcomeLabelContainer.leadingAnchor, constant: horizontalPadding).isActive = true
        welcomeLabel.trailingAnchor.constraint(equalTo: welcomeLabelContainer.trailingAnchor, constant: -horizontalPadding).isActive = true
        welcomeLabel.topAnchor.constraint(equalTo: welcomeLabelContainer.topAnchor).isActive = true
        welcomeLabel.bottomAnchor.constraint(equalTo: welcomeLabelContainer.bottomAnchor).isActive = true
        
        let welcomeBottomContainer: UIView = UIView()
        welcomeBottomContainer.translatesAutoresizingMaskIntoConstraints = false
        welcomeBottomContainer.heightAnchor.constraint(equalToConstant: 36).isActive = true
        
        let emailContainer: UIView = UIView()
        emailContainer.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.heightAnchor.constraint(equalToConstant: 55).isActive = true
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailContainer.addSubview(emailField)
        emailField.leadingAnchor.constraint(equalTo: emailContainer.leadingAnchor, constant: horizontalPadding).isActive = true
        emailField.trailingAnchor.constraint(equalTo: emailContainer.trailingAnchor, constant: -horizontalPadding).isActive = true
        emailField.topAnchor.constraint(equalTo: emailContainer.topAnchor).isActive = true
        emailField.bottomAnchor.constraint(equalTo: emailContainer.bottomAnchor).isActive = true
        
        let emailBottomContainer: UIView = UIView()
        emailBottomContainer.translatesAutoresizingMaskIntoConstraints = false
        emailBottomContainer.heightAnchor.constraint(equalToConstant: 31).isActive = true
        
        let passwordContainer: UIView = UIView()
        passwordContainer.translatesAutoresizingMaskIntoConstraints = false
        passwordContainer.heightAnchor.constraint(equalToConstant: 55).isActive = true
        passwordField.translatesAutoresizingMaskIntoConstraints = false
        passwordContainer.addSubview(passwordField)
        passwordField.leadingAnchor.constraint(equalTo: passwordContainer.leadingAnchor, constant: horizontalPadding).isActive = true
        passwordField.trailingAnchor.constraint(equalTo: passwordContainer.trailingAnchor, constant: -horizontalPadding).isActive = true
        passwordField.topAnchor.constraint(equalTo: passwordContainer.topAnchor).isActive = true
        passwordField.bottomAnchor.constraint(equalTo: passwordContainer.bottomAnchor).isActive = true
        
        let forgoPasswordContainer: UIView = UIView()
        forgoPasswordContainer.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 33).isActive = true
        forgoPasswordContainer.addSubview(forgotPasswordButton)
        forgotPasswordButton.trailingAnchor.constraint(equalTo: forgoPasswordContainer.trailingAnchor, constant: -horizontalPadding).isActive = true
        forgotPasswordButton.topAnchor.constraint(equalTo: forgoPasswordContainer.topAnchor).isActive = true
        forgotPasswordButton.bottomAnchor.constraint(equalTo: forgoPasswordContainer.bottomAnchor).isActive = true
        
        let forgotPasswordBottomContainer: UIView = UIView()
        forgotPasswordBottomContainer.translatesAutoresizingMaskIntoConstraints = false
        forgotPasswordBottomContainer.heightAnchor.constraint(equalToConstant: 52).isActive = true
        
        let loginButtonContainer: UIView = UIView()
        loginButtonContainer.translatesAutoresizingMaskIntoConstraints = false
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButtonContainer.addSubview(loginButton)
        loginButton.leadingAnchor.constraint(equalTo: loginButtonContainer.leadingAnchor, constant: horizontalPadding).isActive = true
        loginButton.trailingAnchor.constraint(equalTo: loginButtonContainer.trailingAnchor, constant: -horizontalPadding).isActive = true
        loginButton.topAnchor.constraint(equalTo: loginButtonContainer.topAnchor).isActive = true
        loginButton.bottomAnchor.constraint(equalTo: loginButtonContainer.bottomAnchor).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true

        let stackView = UIStackView(arrangedSubviews: [welcomeLabelContainer, welcomeBottomContainer, emailContainer, emailBottomContainer, passwordContainer, forgoPasswordContainer, forgotPasswordBottomContainer, loginButtonContainer])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        stackView.alignment = .fill
        stackView.distribution = .fill

        scrollView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor).isActive = true
        stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor).isActive = true
        stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: scrollView.frameLayoutGuide.widthAnchor).isActive = true
    }
}
