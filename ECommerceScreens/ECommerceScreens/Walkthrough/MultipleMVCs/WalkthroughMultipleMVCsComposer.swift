//
//  WalkthroughMultipleMVCsComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

public class WalkthroughMultipleMVCsComposer {
    public static func compose(items: [WalkthroughItem],
                        onFinish: @escaping WalkthroughMultipleMVCs.FinishCompletion,
                        shouldAnimate: Bool = false) -> WalkthroughMultipleMVCs {
        let bottomViewController = WalkthroughBottomViewController(totalItems: items.count)
        let vc = WalkthroughMultipleMVCs(cellControllers: items.map { WalkthroughCCController(model: $0) },
                                         currentItemTrackingLabelController: WalkthroughCurrentItemTrackingLabelController(totalItems: items.count),
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
