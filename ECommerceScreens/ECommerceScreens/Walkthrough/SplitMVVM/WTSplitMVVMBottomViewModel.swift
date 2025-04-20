//
//  WTSplitMVVMBottomViewModel.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 20/04/25.
//

import Foundation

class WTSplitMVVMBottomViewModel {
    typealias Observer<T> = (T) -> Void
    let totalItems: Int
    
    var onPreviousButtonVisibilityChange: Observer<Bool>?
    var onScroll: Observer<Int>?
    var onNextButtonTitleChange: Observer<String>?
    
    init(totalItems: Int) {
        self.totalItems = totalItems
    }
    
    func updateVisibleItem(_ item: Int) {
        onScroll?(item)
        
        let nextButtonTitle: String = item == (totalItems - 1) ? "Get Started" : "Next"
        onNextButtonTitleChange?(nextButtonTitle)
        
        let previousButtonVisbility: Bool = item > 0
        onPreviousButtonVisibilityChange?(previousButtonVisbility)
    }
}