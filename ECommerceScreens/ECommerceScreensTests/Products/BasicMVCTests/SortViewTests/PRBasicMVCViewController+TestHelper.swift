//
//  PRBasicMVCViewController+TestHelper.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import UIKit
import ECommerceScreens

extension PRBasicMVCViewController {
    func simulateViewIsAppearing() {
        beginAppearanceTransition(true, animated: false)
        endAppearanceTransition()
    }
}
