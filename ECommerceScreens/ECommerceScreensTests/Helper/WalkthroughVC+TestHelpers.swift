//
//  WalkthroughVC+TestHelpers.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit
@testable import ECommerceScreens

extension WalkthroughVC {
    var walkthroughItemSection: Int {
        0
    }
    
    var numberOfRenderedItems: Int {
        collectionView.numberOfItems(inSection: walkthroughItemSection)
    }
    
    private func walkthgoughItem(at index: Int) -> UICollectionViewCell? {
        let indexPath = IndexPath(item: index, section: walkthroughItemSection)
        let cell: WalkthroughCC? = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: indexPath) as? WalkthroughCC
        return cell
    }
    
    func simulateWalkthroughItemVisible(at index: Int) -> WalkthroughCC? {
        walkthgoughItem(at: index) as? WalkthroughCC
    }
}
