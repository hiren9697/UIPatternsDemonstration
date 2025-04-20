//
//  WTBasicMVVMViewModel.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 20/04/25.
//

import Foundation

class WTBasicMVVMViewModel {
    typealias Observer<T> = (T) -> Void
    let totalItems: Int
    var onItemScroll: Observer<Int>?
    var onNextButtonTitleChange: Observer<String>?
    var onPreviousButtonVisibilityChange: Observer<Bool>?
    var onCurrentItemTrackingTextChange: Observer<String>?
    
    init(totalItems: Int) {
        self.totalItems = totalItems
    }
    
    func itemScrolled(currentItem item: Int) {
        onItemScroll?(item)
        
        let nextButtonTitle: String = item >= (totalItems - 1) ? "Get Started" : "Next"
        onNextButtonTitleChange?(nextButtonTitle)
        
        let previousButtonVisibility: Bool = item > 0
        onPreviousButtonVisibilityChange?(previousButtonVisibility)
        
        let displayItem: Int = item + 1
        let currentItemTrackingText: String = "\(displayItem)/\(totalItems)"
        onCurrentItemTrackingTextChange?(currentItemTrackingText)
    }
}