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
        case .selected: return UIImage(systemName: "circle.circle")!
        case .unSelected: return UIImage(systemName: "circle")!
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
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureInitialUI() {
        titleLabel.text = type.title
        selectionImageView.tintColor = .black
        selectionImageView.contentMode = .scaleAspectFit
        selectionImageView.image = isSelected ? PRSortOptionState.selected.image : PRSortOptionState.unSelected.image
        button.addTarget(self, action: #selector(handleButtonTap), for: .touchUpInside)
    }
    
    @objc func handleButtonTap() {
        completion(type)
    }
    
    private func setupConstraints() {
        titleLabel.setContentHuggingPriority(UILayoutPriority(rawValue: 250), for: .horizontal)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        selectionImageView.setContentHuggingPriority(UILayoutPriority(rawValue: 251), for: .horizontal)
        selectionImageView.translatesAutoresizingMaskIntoConstraints = false
        
        let stackView = UIStackView(arrangedSubviews: [selectionImageView, titleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fill
        
        let containerView = UIView()
        self.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true

        containerView.addSubview(stackView)
        stackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: 20).isActive = true
        stackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 15).isActive = true
        stackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -15).isActive = true
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
