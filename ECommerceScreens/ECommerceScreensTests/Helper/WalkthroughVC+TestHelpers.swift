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
    
    var pageIndicatorTotalPages: Int {
        pageControl.numberOfPages
    }
    
    var pageIndicatorCurrentPage: Int {
        pageControl.currentPage
    }
    
    private func walkthgoughItem(at index: Int) -> UICollectionViewCell? {
        let indexPath = IndexPath(item: index, section: walkthroughItemSection)
        let cell: WalkthroughCC? = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: indexPath) as? WalkthroughCC
        return cell
    }
    
    func simulateWalkthroughItemVisible(at index: Int) -> WalkthroughCC? {
        walkthgoughItem(at: index) as? WalkthroughCC
    }
    
    func scrollToNextItem(totalItemCount: Int) {
        let pageCGFloat = collectionView.contentOffset.x / collectionView.bounds.width
        let pageIndexInt: Int = Int(pageCGFloat.rounded(.toNearestOrAwayFromZero))
        guard pageIndexInt < (totalItemCount - 1) else {
            return
        }
        let currentOffset = collectionView.contentOffset
        let newOffset = currentOffset.x + collectionView.bounds.width
        collectionView.contentOffset = CGPoint(x: newOffset, y: collectionView.contentOffset.y)
        collectionView.delegate!.scrollViewDidScroll?(collectionView)
    }
}
