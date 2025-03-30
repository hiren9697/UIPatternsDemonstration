//
//  WalkthroughVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit

public class WalkthroughVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    let pageControl: UIPageControl = UIPageControl()
    
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
        pageControl.numberOfPages = items.count
        collectionView.register(WalkthroughCC.self,
                                forCellWithReuseIdentifier: "WalkthroughCC")
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(collectionView)
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.reloadData()
    }
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalkthroughCC", for: indexPath) as! WalkthroughCC
        cell.imageView.image = items[indexPath.item].image
        cell.titleLabel.text = items[indexPath.item].title
        cell.subtitleLabel.text = items[indexPath.item].subtitle
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        guard scrollView.contentOffset.x > 0 else {
            return
        }
        let pageCGFloat = scrollView.contentOffset.x / scrollView.bounds.width
        let pageIndexInt = pageCGFloat.rounded(.toNearestOrAwayFromZero)
        pageControl.currentPage = Int(pageIndexInt)
    }
}
