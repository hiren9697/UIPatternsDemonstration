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
        configureUI()
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
    private func configureUI() {
        activityIndicator.hidesWhenStopped = true
        isHidden = true
        
        addSubview(containerView)
        
        containerView.addSubview(activityIndicator)
    }
    
    // MARK: - Test Properties
    public var isActivityIndicatorAnimating: Bool {
        return activityIndicator.isAnimating
    }
}


