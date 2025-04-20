//
//  WalkthroughCurrentItemTrackingLabelController.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class WTSplitMVVMCurrentItemTrackingLabelController {
    let view = UILabel()
    let viewModel: WTSplitMVVMCurrentItemTrackingLabelViewModel
    
    init(viewModel: WTSplitMVVMCurrentItemTrackingLabelViewModel) {
        self.viewModel = viewModel
        configureInitialUI()
        bind()
    }
    
    private func configureInitialUI() {
        view.textColor = AppColors.c000000
    }
    
    private func bind() {
        viewModel.onTextChange = { [weak self] text in
            self?.view.text = text
        }
    }
    
    func updateVisibleItem(_ item: Int) {
        viewModel.visibleItemChanged(item)
    }
}
