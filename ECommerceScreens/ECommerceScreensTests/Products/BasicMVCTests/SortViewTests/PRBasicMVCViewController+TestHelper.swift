//
//  PRBasicMVCViewController+TestHelper.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import UIKit
@testable import ECommerceScreens

extension PRBasicMVCViewController {
    func simulateViewIsAppearing() {
        beginAppearanceTransition(true, animated: false)
        endAppearanceTransition()
    }
    
    func simulateUserInitiatedRefresh() {
        refreshControl.simulatePullToRefresh()
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
}
