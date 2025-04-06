//
//  UIButton+Helper.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 05/04/25.
//

import UIKit

extension UIButton {
    func simulateTap() {
        self.allTargets.forEach { target in
            self.actions(forTarget: target, forControlEvent: .touchUpInside)?.forEach({ action in
                (target as NSObject).perform(Selector(action))
            })
        }
    }
}
