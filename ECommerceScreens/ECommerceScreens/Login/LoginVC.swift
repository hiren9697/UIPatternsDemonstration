//
//  LoginVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class LoginVC: UIViewController {
    let welcomeLabel: UILabel = UILabel()
    let emailField: InputFieldView = InputFieldView(iconImage: UIImage(named: "ic_user",
                                                                       in: Bundle(identifier: "hiren.ECommerceScreens"),
                                                                       with: nil)!,
                                                    placeholder: "Email",
                                                    keyboardType: .emailAddress,
                                                    returnKeyType: .next,
                                                    isSecureTextEntry: true,
                                                    onReturn: {
        return true
    })
    
    public init() {
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
    
    // MARK: - UI Helper
    private func configureInitialUI() {
        view.backgroundColor = .white
        
        welcomeLabel.text = "Welcome\nBack!"
        welcomeLabel.font = UIFont.boldSystemFont(ofSize: 36)
        welcomeLabel.textColor = AppColors.c000000
    }
    
    private func layoutUIComponents() {
        view.addSubview(emailField)
        emailField.translatesAutoresizingMaskIntoConstraints = false
        emailField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        emailField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        emailField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        emailField.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
}
