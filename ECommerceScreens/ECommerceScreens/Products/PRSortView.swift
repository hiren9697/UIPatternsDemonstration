//
//  PRSortView.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 22/04/25.
//

import UIKit

public class PRSortView: UIView {
    public init() {
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public static func present(in parentView: UIView) -> PRSortView {
        let sortView = PRSortView()
        sortView.translatesAutoresizingMaskIntoConstraints = false
        parentView.addSubview(sortView)
//        sortView.leadingAnchor.constraint(equalTo: parentView.leadingAnchor).isActive = true
//        sortView.trailingAnchor.constraint(equalTo: parentView.trailingAnchor).isActive = true
//        sortView.topAnchor.constraint(equalTo: parentView.topAnchor).isActive = true
//        sortView.bottomAnchor.constraint(equalTo: parentView.bottomAnchor).isActive = true
        return sortView
    }
}
