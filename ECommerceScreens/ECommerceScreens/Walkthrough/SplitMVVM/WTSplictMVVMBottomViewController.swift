//
//  WalkthroughBottomViewController.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class WTSplictMVVMBottomViewController: NSObject {
    let view = WTSplitMVCBottomView()
    let viewModel: WTSplitMVVMBottomViewModel
    var onPreviousTap: (() -> Void)?
    var onNextTap: (() -> Void)?
    
    init(totalItems: Int,
         viewModel: WTSplitMVVMBottomViewModel) {
        self.viewModel = viewModel
        super.init()
        configureInitialUI(totalItems: totalItems)
        bind()
        view.previousButton.addTarget(self, action: #selector(previousTap), for: .touchUpInside)
        view.nextButton.addTarget(self, action: #selector(nextTap), for: .touchUpInside)
    }
    
    private func configureInitialUI(totalItems: Int) {
        view.pageControl.numberOfPages = totalItems
    }
    
    private func bind() {
        viewModel.onScroll = {[weak self] currentItem in
            self?.view.pageControl.currentPage = currentItem
        }
        
        viewModel.onNextButtonTitleChange = {[weak self] title in
            self?.view.nextButton.setTitle(title, for: .normal)
        }
        
        viewModel.onPreviousButtonVisibilityChange = {[weak self] isVisible in
            self?.view.previousButton.isHidden = !isVisible
        }
    }
    
    func updateVisibleItem(_ item: Int) {
        viewModel.updateVisibleItem(item)
    }
    
    @objc func previousTap() {
        onPreviousTap?()
    }
    
    @objc func nextTap() {
        onNextTap?()
    }
}

