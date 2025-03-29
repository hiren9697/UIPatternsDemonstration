//
//  WalkthroughVC+TestHelpers.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

@testable import ECommerceScreens

extension WalkthroughVC {
    var walkthroughItemSection: Int {
        0
    }
    
    var numberOfRenderedItems: Int {
        collectionView.numberOfItems(inSection: walkthroughItemSection)
    }
    
    func renderedItem(at index: Int) -> WalkthroughCC? {
        let indexPath = IndexPath(item: index, section: walkthroughItemSection)
        return collectionView.cellForItem(at: indexPath) as? WalkthroughCC
    }
}
