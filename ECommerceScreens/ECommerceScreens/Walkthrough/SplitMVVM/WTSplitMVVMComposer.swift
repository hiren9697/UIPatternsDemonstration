//
//  WalkthroughMultipleMVCsComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class WTSplitMVVMComposer {
    public static func compose(items: [WalkthroughItem],
                        onFinish: @escaping WTSplitMVVMViewController.FinishCompletion,
                        shouldAnimate: Bool = false) -> WTSplitMVVMViewController {
        let bottomViewController = WTSplictMVVMBottomViewController(totalItems: items.count,
                                                                    viewModel: WTSplitMVVMBottomViewModel(totalItems: items.count))
        let vc = WTSplitMVVMViewController(cellControllers: items.map { WTSplitMVVMCellController(model: $0) },
                                           currentItemTrackingLabelController: WTSplitMVVMCurrentItemTrackingLabelController(viewModel: WTSplitMVVMCurrentItemTrackingLabelViewModel(totalItems: items.count)),
                                         bottomViewController: bottomViewController,
                                         onFinish: onFinish)
        bottomViewController.onPreviousTap = {[weak vc] in
            vc?.scrollToPreviousItem()
        }
        bottomViewController.onNextTap = {[weak vc] in
            vc?.scrollToNextItem()
        }
        return vc
    }
}
