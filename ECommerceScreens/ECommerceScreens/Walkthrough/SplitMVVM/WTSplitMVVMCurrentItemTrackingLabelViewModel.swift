//
//  WTSplitMVVMCurrentItemTrackingLabelViewModel.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 20/04/25.
//

import Foundation

class WTSplitMVVMCurrentItemTrackingLabelViewModel {
    typealias Observer<T> = (T) -> Void
    let totalItems: Int
    var onTextChange: Observer<String>?
    
    init(totalItems: Int) {
        self.totalItems = totalItems
    }
    
    func visibleItemChanged(_ item: Int) {
        let text = "\(item + 1)/\(totalItems)"
        onTextChange?(text)
    }
}