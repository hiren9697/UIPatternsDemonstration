//
//  WalkthroughCurrentItemTrackingLabelController.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class WTSplitMVCCurrentItemTrackingLabelController {
    let view = UILabel()
    let totalItems: Int
    
    init(totalItems: Int) {
        self.totalItems = totalItems
        configureInitialUI()
    }
    
    private func configureInitialUI() {
        view.textColor = AppColors.c000000
    }
    
    func updateVisibleItem(_ item: Int) {
        view.text = "\(item + 1)/\(totalItems)"
    }
}
