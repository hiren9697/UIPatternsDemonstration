//
//  WalkthroughMultipleMVCsComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class WTSplitMVCComposer {
    public static func compose(items: [WalkthroughItem],
                        onFinish: @escaping WTSplitMVCViewController.FinishCompletion,
                        shouldAnimate: Bool = false) -> WTSplitMVCViewController {
        let bottomViewController = WTSplictMVCBottomViewController(totalItems: items.count)
        let vc = WTSplitMVCViewController(cellControllers: items.map { WTSplitMVCCellController(model: $0) },
                                         currentItemTrackingLabelController: WTSplitMVCCurrentItemTrackingLabelController(totalItems: items.count),
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
