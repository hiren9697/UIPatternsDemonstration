//
//  PRSortViewComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 26/04/25.
//

import UIKit

public struct PRSortViewComposer {
    public static func compose(selectedSortOption: PRSortOption?,
                               parentView: UIView,
                               completion: @escaping PRSortView.Completion) -> PRSortView {
        let view = PRSortView()
        let lowToHighSortOptionView = PRSortOptionView(type: .lowToHigh,
                                                       isSelected: selectedSortOption == .lowToHigh,
                                                       completion: {[weak view] _ in
            completion(.lowToHigh)
            view?.dismiss()
        })
        let hightToLowSortOptionView = PRSortOptionView(type: .highToLow,
                                                        isSelected: selectedSortOption == .highToLow,
                                                        completion: {[weak view] _ in
            completion(.highToLow)
            view?.dismiss()
        })
        view.lowToHighSortOptionView = lowToHighSortOptionView
        view.hightToLowSortOptionView = hightToLowSortOptionView
        
        view.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(view)
        
        return view
    }
}
