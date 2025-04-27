//
//  Loader.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import UIKit

public class Loader: UIView {
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
    public func show() {
        activityIndicator.startAnimating()
        isHidden = false
    }
    
    public func hide() {
        activityIndicator.stopAnimating()
        isHidden = true
    }
    
    // MARK: - UI Helper
    private func configureInitialUI() {
        activityIndicator.style = .medium
        activityIndicator.hidesWhenStopped = true
        containerView.backgroundColor = AppColors.cC4C4C4
        containerView.layer.cornerRadius = 8
        containerView.layer.masksToBounds = true
        isHidden = true
    }
    
    private func setupConstraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        
        widthAnchor.constraint(equalToConstant: 50).isActive = true
        heightAnchor.constraint(equalToConstant: 50).isActive = true

        addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        
        containerView.addSubview(activityIndicator)
        activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor).isActive = true
    }
    
    // MARK: - Test Properties
    public var isActivityIndicatorAnimating: Bool {
        return activityIndicator.isAnimating
    }
}


