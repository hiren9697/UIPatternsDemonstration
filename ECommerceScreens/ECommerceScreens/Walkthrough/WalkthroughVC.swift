//
//  WalkthroughVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit

public class WalkthroughVC: UIViewController, UICollectionViewDataSource {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: layout)
        collectionView.dataSource = self
        return collectionView
    }()
    
    private let items: [WalkthroughItem]
    
    public init(items: [WalkthroughItem]) {
        self.items = items
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("WalkthroughVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = WalkthroughCC()
        cell.imageView.image = items[indexPath.item].image
        cell.titleLabel.text = items[indexPath.item].title
        cell.subtitleLabel.text = items[indexPath.item].subtitle
        return cell
    }
}
