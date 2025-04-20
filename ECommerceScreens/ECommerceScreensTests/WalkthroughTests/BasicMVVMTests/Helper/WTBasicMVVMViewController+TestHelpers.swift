//
//  WalkthroughVC+TestHelpers.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit
@testable import ECommerceScreens

extension WTBasicMVVMViewController {
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
    
    var currentItemTrackingText: String {
        currentItemTrackingLabel.text ?? ""
    }
    
    var nextButtonText: String {
        nextButton.title(for: .normal) ?? ""
    }
    
    var visibleItemIndex: Int? {
        collectionView.indexPathsForVisibleItems.first?.item
    }
    
    private func walkthgoughItem(at index: Int) -> UICollectionViewCell? {
        let indexPath = IndexPath(item: index, section: walkthroughItemSection)
        let cell: WalkthroughCC? = collectionView.dataSource?.collectionView(collectionView, cellForItemAt: indexPath) as? WalkthroughCC
        return cell
    }
    
    func simulateWalkthroughItemVisible(at index: Int) -> WalkthroughCC? {
        walkthgoughItem(at: index) as? WalkthroughCC
    }
    
    func setInitialContentOffset() {
        collectionView.contentOffset = CGPoint(x: collectionView.bounds.width, y: collectionView.contentOffset.y)
    }
    
    /// Starts with index 1 up to last item ex. 3 (1, 2, 3)
    func simulateScrollToNextItemByUpdatingOffset(totalItemCount: Int) {
        func getCurrentIndex() -> Int {
            guard collectionView.contentOffset.x > 0 else { return 0 }
            let pageCGFloat = collectionView.contentOffset.x / collectionView.bounds.width
            let pageIndexInt: Int = Int(pageCGFloat.rounded(.toNearestOrAwayFromZero))
            return pageIndexInt
        }
        print("--- ScrollToNextItem, contentOffset before: \(collectionView.contentOffset.x), collectionView width: \(collectionView.bounds.width) ---")
        
        let currentIndex = getCurrentIndex()
        guard currentIndex < totalItemCount else {
            return
        }
        let currentOffset = collectionView.contentOffset
        let newOffset = currentOffset.x + collectionView.bounds.width
        collectionView.contentOffset = CGPoint(x: newOffset, y: collectionView.contentOffset.y)
        collectionView.delegate!.scrollViewDidScroll?(collectionView)
        print("--- ScrollToNextItem, contentOffset after: \(collectionView.contentOffset.x) ---")
    }
    
    func simulateScrollToLastItem(totalItemCount: Int) {
        let lastIndexPath = IndexPath(item: totalItemCount - 1, section: walkthroughItemSection)
        collectionView.scrollToItem(at: lastIndexPath, at: .centeredHorizontally, animated: false)
        collectionView.layoutIfNeeded()
    }
    
    func simulateScrollToNextItem(totalItemCount: Int) {
        func getCurrentIndex() -> Int? {
            collectionView.indexPathsForVisibleItems.first?.item
        }
        guard let currentIndex = getCurrentIndex(),
        currentIndex < (totalItemCount - 1) else {
            return
        }
        let nextItem = currentIndex + 1
        let indexPath = IndexPath(item: nextItem, section: walkthroughItemSection)
        collectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: false)
        collectionView.layoutIfNeeded()
        print("CollectionView width: \(collectionView.bounds.width), visibleIndexPaths: \(collectionView.indexPathsForVisibleItems)")
    }
    
    func simulateScrollToPreviousItem() {
        print("--- TEST ScrollToPreviousItem, contentOffset before: \(collectionView.contentOffset.x) ---")
        guard collectionView.contentOffset.x > 0 else {
            return
        }
        let newOffsetX = max(0, (collectionView.contentOffset.x - collectionView.bounds.width))
        collectionView.contentOffset = CGPoint(x: newOffsetX, y: collectionView.contentOffset.y)
        collectionView.delegate!.scrollViewDidScroll?(collectionView)
        print("--- TEST ScrollToPreviousItem, contentOffset after: \(collectionView.contentOffset.x) ---")
    }
    
    func simulatePreviousButtonTap() {
        previousButton.simulateTap()
    }
    
    func simulateNextButtonTap() {
        nextButton.simulateTap()
    }
}

