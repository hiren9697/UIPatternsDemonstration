//
//  WalkthroughMultipleMVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 05/04/25.
//

import UIKit

public class WalkthroughMultipleMVCs: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    public typealias FinishCompletion = () -> Void
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect.zero,
                                              collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    var pageControl: UIPageControl {
        bottomViewController.view.pageControl
    }
    var currentItemTrackingLabel: UILabel {
        currentItemTrackingLabelController.view
    }
    let currentItemTrackingLabelController: WalkthroughCurrentItemTrackingLabelController
    var previousButton: UIButton {
        bottomViewController.view.previousButton
    }
    var nextButton: UIButton {
        bottomViewController.view.nextButton
    }
    let bottomViewController: WalkthroughBottomViewController
    
    private let cellControllers: [WalkthroughCCController]
    private let shouldAnimate: Bool
    private let onFinish: FinishCompletion
    
    public init(cellControllers: [WalkthroughCCController],
                currentItemTrackingLabelController: WalkthroughCurrentItemTrackingLabelController,
                bottomViewController: WalkthroughBottomViewController,
                shouldAnimate: Bool = true,
                onFinish: @escaping FinishCompletion) {
        self.cellControllers = cellControllers
        self.shouldAnimate = shouldAnimate
        self.onFinish = onFinish
        self.currentItemTrackingLabelController = currentItemTrackingLabelController
        self.bottomViewController = bottomViewController
        super.init(nibName: nil, bundle: nil)
        self.bottomViewController.onPreviousTap = { [weak self] in
            self?.scrollToPreviousItem()
        }
        self.bottomViewController.onNextTap = { [weak self] in
            self?.scrollToNextItem()
        }
    }
    
    required public init?(coder: NSCoder) {
        fatalError("WalkthroughVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        layoutComponents()
        setupCollectionView()
        updateCurrentItemTrackingUI()
    }
    
    // MARK: - UI Layout
    private func layoutComponents() {
        func layoutCollectionView() {
            collectionView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(collectionView)
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            collectionView.reloadData()
        }
        func layoutCurrentItemTrackingLabel() {
            currentItemTrackingLabelController.view.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(currentItemTrackingLabelController.view)
            currentItemTrackingLabelController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
            currentItemTrackingLabelController.view.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        }
        func layoutBottomView() {
            view.addSubview(bottomViewController.view)
            bottomViewController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            bottomViewController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            bottomViewController.view.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        }
        
        layoutCollectionView()
        layoutCurrentItemTrackingLabel()
        layoutBottomView()
    }
    
    // MARK: - Helpers
    private func setupCollectionView() {
        collectionView.register(WalkthroughCC.self,
                                forCellWithReuseIdentifier: "WalkthroughCC")
    }
    
    private func updateCurrentItemTrackingUI() {
        guard collectionView.contentOffset.x > 0 else {
            currentItemTrackingLabelController.updateVisibleItem(0)
            bottomViewController.updateVisibleItem(0)
            return
        }
        let pageCGFloat = collectionView.contentOffset.x / collectionView.bounds.width
        let pageIndexInt = pageCGFloat.rounded(.toNearestOrAwayFromZero)
        let currentItemIndex: Int = Int(pageIndexInt)
        currentItemTrackingLabelController.updateVisibleItem(currentItemIndex)
        bottomViewController.updateVisibleItem(currentItemIndex)
        print("CollectionView offset: \(collectionView.contentOffset.x), pageCGFloat: \(pageCGFloat), pageIndexInt: \(pageIndexInt)")
    }
    
    func scrollToPreviousItem() {
        guard let indexPath = collectionView.indexPathsForVisibleItems.first else { return }
        let previousItem = indexPath.item - 1
        guard previousItem >= 0 else { return }
        let previousIndexPath = IndexPath(item: previousItem, section: indexPath.section)
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: previousIndexPath, at: .centeredHorizontally, animated: shouldAnimate)
        collectionView.isPagingEnabled = true
    }
    
    func scrollToNextItem() {
        guard let indexPath = collectionView.indexPathsForVisibleItems.first else { return }
        let nextItem = indexPath.item + 1
        guard nextItem < cellControllers.count else {
            onFinish()
            return
        }
        let nextIndexPath = IndexPath(item: nextItem, section: indexPath.section)
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: shouldAnimate)
        collectionView.isPagingEnabled = true
    }
    
    // MARK: - CollectionView DataSource
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cellControllers.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WalkthroughCC", for: indexPath) as! WalkthroughCC
        return cellControllers[indexPath.row].configuare(cell: cell)
    }
    
    // MARK: - CollectionView Layout
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        .leastNonzeroMagnitude
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width, height: view.bounds.height)
    }
    
    // MARK: - ScrollView Method
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        updateCurrentItemTrackingUI()
    }
}

