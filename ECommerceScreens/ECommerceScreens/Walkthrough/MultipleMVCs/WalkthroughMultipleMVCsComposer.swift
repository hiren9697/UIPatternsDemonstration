//
//  WalkthroughMultipleMVCsComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 06/04/25.
//

import UIKit

class WalkthroughMultipleMVCsComposer {
    static func compose(items: [WalkthroughItem],
                        onFinish: @escaping WalkthroughMultipleMVCs.FinishCompletion,
                        shouldAnimate: Bool = false) -> WalkthroughMultipleMVCs {
        let vc = WalkthroughMultipleMVCs(cellControllers: items.map { WalkthroughCCController(model: $0) },
                                         currentItemTrackingLabelController: WalkthroughCurrentItemTrackingLabelController(totalItems: items.count),
                                         bottomViewController: WalkthroughBottomViewController(totalItems: items.count),
                                         onFinish: onFinish)
        return vc
    }
}
