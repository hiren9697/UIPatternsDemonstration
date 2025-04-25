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
    private let button: UIButton = UIButton()
    
    private let type: PRSortOption
    private let isSelected: Bool
    private let completion: (PRSortOption) -> Void
    
    public init(type: PRSortOption,
                isSelected: Bool,
                completion: @escaping (PRSortOption) -> Void) {
        self.type = type
        self.isSelected = isSelected
        self.completion = completion
        super.init(frame: .zero)
        configureInitialUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureInitialUI() {
        titleLabel.text = type.title
        selectionImageView.image = isSelected ? PRSortOptionState.selected.image : PRSortOptionState.unSelected.image
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        completion(type)
    }
    
    // Test properties
    public var titleText: String? {
        titleLabel.text
    }
    public var selectionImage: UIImage? {
        selectionImageView.image
    }
    public func simulateClick() {
        button.simulateTap()
    }
}
