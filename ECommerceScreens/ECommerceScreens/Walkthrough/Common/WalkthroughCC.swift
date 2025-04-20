//
//  WalkthroughCC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit

public class WalkthroughCC: UICollectionViewCell {
    let imageView: UIImageView = UIImageView()
    let titleLabel: UILabel = UILabel()
    let subtitleLabel: UILabel = UILabel()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        print("Init called")
        configureUIComponents()
        layoutUIComponents()
    }
    
    required init?(coder: NSCoder) {
        fatalError("This class is designed programmatically, so shouldn't be initialized via storyboard")
    }
    
    private func configureUIComponents() {
        titleLabel.textColor = AppColors.c000000
        subtitleLabel.textColor = AppColors.cA8A8A9
    }
    
    // MARK: - UI Helpers
    private func layoutUIComponents() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.font = .systemFont(ofSize: 14)
        subtitleLabel.textColor = .gray
        subtitleLabel.numberOfLines = 0
        subtitleLabel.textAlignment = .center

        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel, subtitleLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .fill
        stackView.spacing = 10
        contentView.addSubview(stackView)
        stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        stackView.centerXAnchor.constraint(equalTo: contentView.centerXAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15).isActive = true
        stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15).isActive = true
    }
}
