//
//  PRSortOptionView.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 23/04/25.
//

import UIKit

public enum PRSortOptionState {
    case selected
    case unSelected
    
    public var image: UIImage {
        switch self {
        case .selected: return UIImage(systemName: "circle")!
        case .unSelected: return UIImage(systemName: "circle.circle")!
        }
    }
}

public class PRSortOptionView: UIView {
    private let titleLabel: UILabel = UILabel()
    private let selectionImageView: UIImageView = UIImageView()
    
    private let type: PRSortOption
    private let isSelected: Bool
    
    public init(type: PRSortOption, isSelected: Bool) {
        self.type = type
        self.isSelected = isSelected
        super.init(frame: .zero)
        configureInitialUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureInitialUI() {
        titleLabel.text = type.title
        selectionImageView.image = isSelected ? PRSortOptionState.selected.image : PRSortOptionState.unSelected.image
    }
    
    // Test properties
    public var titleText: String? {
        titleLabel.text
    }
    public var selectionImage: UIImage? {
        selectionImageView.image
    }
}
