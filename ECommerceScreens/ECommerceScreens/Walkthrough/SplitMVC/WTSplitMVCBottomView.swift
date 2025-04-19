//
//  WalkthroughBottomView.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

class WTSplitMVCBottomView: UIView {
    let previousButton = UIButton()
    let pageControl = UIPageControl()
    let nextButton = UIButton()
    
    init() {
        super.init(frame: .zero)
        configureInitialUI()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutUIComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("WalkthroughBottomView is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    private func layoutUIComponents() {
        self.translatesAutoresizingMaskIntoConstraints = false
        
        let containerView = UIView()
        containerView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(containerView)
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -20).isActive = true
        containerView.heightAnchor.constraint(equalToConstant: 44).isActive = true

        previousButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(previousButton)
        previousButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 17).isActive = true
        previousButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        previousButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(pageControl)
        pageControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
        pageControl.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        pageControl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        containerView.addSubview(nextButton)
        nextButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -17).isActive = true
        nextButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
        nextButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
    }
    
    private func configureInitialUI() {
        previousButton.setTitle("Prev", for: .normal)
        previousButton.setTitleColor(AppColors.cC4C4C4, for: .normal)
        pageControl.pageIndicatorTintColor = AppColors.cC4C4C4
        pageControl.currentPageIndicatorTintColor = AppColors.c000000
        nextButton.setTitleColor(AppColors.cF83758, for: .normal)
        nextButton.setTitle("Next", for: .normal)
    }
}
