//
//  PRBasicMVCViewController+TestHelper.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import UIKit
@testable import ECommerceScreens

extension PRBasicMVCViewController {
    var isShowingProductLoadingIndicator: Bool {
        loadingView.isVisible
    }
    var isRefreshControlRefreshing: Bool {
        refreshControl.isRefreshing
    }
    
    func simulateViewIsAppearing() {
        beginAppearanceTransition(true, animated: false)
        endAppearanceTransition()
    }
    
    func simulateUserInitiatedRefresh() {
        refreshControl.beginRefreshing()
        print(refreshControl.isRefreshing)
        refreshControl.simulatePullToRefresh()
    }
    
    func replaceRefreshControlWithFake() {
        let fake = FakeRefreshControl()
        refreshControl.transferTargetActions(to: fake)
        refreshControl = fake
        refreshControl = fake
    }
}

extension UIRefreshControl {
    func simulatePullToRefresh() {
        allTargets.forEach { target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach { action in
                (target as NSObject).perform(Selector(action))
            }
        }
    }
    
    func transferTargetActions(to control: UIRefreshControl) {
        allTargets.forEach({ target in
            actions(forTarget: target, forControlEvent: .valueChanged)?.forEach({ action in
                control.addTarget(target, action: Selector(action), for: .valueChanged)
            })
        })
    }
}

class FakeRefreshControl: UIRefreshControl {
    private var _isRefreshing = false
    
    override var isRefreshing: Bool { _isRefreshing }
    
    override func beginRefreshing() {
        _isRefreshing = true
    }
    
    override func endRefreshing() {
        _isRefreshing = false
    }
}
