//
//  WalkthroughBottomViewController.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class WTSplictMVCBottomViewController: NSObject {
    let totalItems: Int
    let view = WTSplitMVCBottomView()
    var onPreviousTap: (() -> Void)?
    var onNextTap: (() -> Void)?
    
    init(totalItems: Int) {
        self.totalItems = totalItems
        super.init()
        view.pageControl.numberOfPages = totalItems
        view.previousButton.addTarget(self, action: #selector(previousTap), for: .touchUpInside)
        view.nextButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    func updateVisibleItem(_ item: Int) {
        view.previousButton.isHidden = item == 0
        view.pageControl.currentPage = item
        let nextButtonTitle = item == (totalItems - 1) ? "Get Started" : "Next"
        view.nextButton.setTitle(nextButtonTitle, for: .normal)
    }
    
    @objc func previousTap() {
        onPreviousTap?()
    }
    
    @objc func nextTap() {
        onNextTap?()
    }
}

