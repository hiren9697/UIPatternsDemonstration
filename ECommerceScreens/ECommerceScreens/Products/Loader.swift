//
//  Loader.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import UIKit

public class Loader: UIView {
    private let backView: UIView = UIView()
    private let containerView: UIView = UIView()
    private let activityIndicator: UIActivityIndicatorView
    
    public init() {
        self.activityIndicator = UIActivityIndicatorView()
        super.init(frame: .zero)
        configureInitialUI()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Public Interface
    public func show(withOverlay: Bool = false) {
        activityIndicator.startAnimating()
        isHidden = false
        if withOverlay {
            backView.isHidden = false
        } else {
            backView.isHidden = true
        }
    }
    
    public func hide() {
        activityIndicator.stopAnimating()
        isHidden = true
        backView.isHidden = true
    }
    
    // MARK: - UI Helper
    private func configureInitialUI() {
        activityIndicator.style = .medium
        activityIndicator.hidesWhenStopped = true
        
        backView.backgroundColor = AppColors.cF3F3F3.withAlphaComponent(0.5)
        
        containerView.backgroundColor = AppColors.cC4C4C4
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        
        isHidden = true
        backView.isHidden = true
    }
    
    private func setupConstraints() {
        backView.translatesAutoresizingMaskIntoConstraints = false
        containerView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(backView)
        backView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        backView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        backView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        backView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true

        addSubview(containerView)
        containerView.widthAnchor.constraint(equalToConstant: 50).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        containerView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        containerView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true

        containerView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    }
    
    // MARK: - Test Properties
    public var isActivityIndicatorAnimating: Bool {
        return activityIndicator.isAnimating
    }
    public var isBackViewVisible: Bool {
        !backView.isHidden
    }
}


