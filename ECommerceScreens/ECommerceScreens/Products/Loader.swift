//
//  Loader.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import UIKit

public class Loader: UIView {
    public let containerView: UIView = UIView()
    public let activityIndicator: UIActivityIndicatorView
    
    public init() {
        self.activityIndicator = UIActivityIndicatorView()
        super.init(frame: .zero)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - UI Helper
    private func configureUI() {
        self.addSubview(containerView)
        
        containerView.addSubview(activityIndicator)
    }
}


