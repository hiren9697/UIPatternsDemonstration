//
//  WalkthroughVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit

public class WTBasicMVCWalkthroughViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
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
    let pageControl: UIPageControl = UIPageControl()
    let currentItemTrackingLabel: UILabel = UILabel()
    let previousButton: UIButton = UIButton()
    let nextButton: UIButton = UIButton()
    
    private let items: [WalkthroughItem]
    private let shouldAnimate: Bool
    private let onFinish: FinishCompletion
    
    public init(items: [WalkthroughItem] = [
        WalkthroughItem(image: UIImage(namedWithInBundle: "ic_walkthrough_item_1")!,
                        title: "Choose Products",
                        subtitle: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
        WalkthroughItem(image: UIImage(namedWithInBundle: "ic_walkthrough_item_2")!,
                        title: "Make Payment",
                        subtitle: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
        WalkthroughItem(image: UIImage(namedWithInBundle: "ic_walkthrough_item_3")!,
                        title: "Get Your Order",
                        subtitle: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
        
    ],
                shouldAnimate: Bool = true,
                onFinish: @escaping FinishCompletion) {
        self.items = items
        self.shouldAnimate = shouldAnimate
        self.onFinish = onFinish
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("WalkthroughVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        configureUIComponents()
        layoutComponents()
        setupCollectionView()
        setupButtons()
        setupPageControl()
        updateCurrentItemTrackingUI()
    }
    
    // MARK: - Button Actions
    @objc func previousButtonTap() {
        guard let indexPath = collectionView.indexPathsForVisibleItems.first else { return }
        let previousItem = indexPath.item - 1
        guard previousItem >= 0 else { return }
        let previousIndexPath = IndexPath(item: previousItem, section: indexPath.section)
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: previousIndexPath, at: .centeredHorizontally, animated: shouldAnimate)
        collectionView.isPagingEnabled = true
    }
    
    @objc func nextButtonTap() {
        guard let indexPath = collectionView.indexPathsForVisibleItems.first else { return }
        let nextItem = indexPath.item + 1
        guard nextItem < items.count else {
            onFinish()
            return
        }
        let nextIndexPath = IndexPath(item: nextItem, section: indexPath.section)
        collectionView.isPagingEnabled = false
        collectionView.scrollToItem(at: nextIndexPath, at: .centeredHorizontally, animated: shouldAnimate)
        collectionView.isPagingEnabled = true
    }
    
    // MARK: - UI Layout
    private func configureUIComponents() {
        currentItemTrackingLabel.textColor = AppColors.c000000
        previousButton.setTitle("Prev", for: .normal)
        previousButton.setTitleColor(AppColors.cC4C4C4, for: .normal)
        pageControl.pageIndicatorTintColor = AppColors.cC4C4C4
        pageControl.currentPageIndicatorTintColor = AppColors.c000000
        nextButton.setTitleColor(AppColors.cF83758, for: .normal)
    }
    
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
            currentItemTrackingLabel.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(currentItemTrackingLabel)
            currentItemTrackingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 17).isActive = true
            currentItemTrackingLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        }
        func layoutBottomComponents() {
            let containerView = UIView()
            containerView.translatesAutoresizingMaskIntoConstraints = false
            view.addSubview(containerView)
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            containerView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
            containerView.heightAnchor.constraint(equalToConstant: 44).isActive = true

            previousButton.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(previousButton)
            previousButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 17).isActive = true
            previousButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            previousButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(pageControl)
            pageControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor).isActive = true
            pageControl.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            pageControl.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
            
            nextButton.translatesAutoresizingMaskIntoConstraints = false
            containerView.addSubview(nextButton)
            nextButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -17).isActive = true
            nextButton.topAnchor.constraint(equalTo: containerView.topAnchor).isActive = true
            nextButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor).isActive = true
        }
        
        layoutCollectionView()
        layoutCurrentItemTrackingLabel()
        layoutBottomComponents()
    }
    
    // MARK: - Helpers
    private func setupCollectionView() {
        collectionView.register(WalkthroughCC.self,
                                forCellWithReuseIdentifier: "WalkthroughCC")
    }
    
    private func setupButtons() {
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextButtonTap), for: .touchUpInside)
        
        previousButton.addTarget(self, action: #selector(previousButtonTap), for: .touchUpInside)
    }
    
    private func setupPageControl() {
        pageControl.numberOfPages = items.count
    }
    
    private func updateCurrentItemTrackingUI() {
        guard collectionView.contentOffset.x > 0 else {
            updateCurrentItemTracking(item: 0)
            updatePreviousButton(item: 0)
            return
        }
        let pageCGFloat = collectionView.contentOffset.x / collectionView.bounds.width
        let pageIndexInt = pageCGFloat.rounded(.toNearestOrAwayFromZero)
        let currentItemIndex: Int = Int(pageIndexInt)
        updateCurrentItemTracking(item: currentItemIndex)
        updatePreviousButton(item: currentItemIndex)
        updateNextButtonTitle(item: currentItemIndex)
        pageControl.currentPage = currentItemIndex
        print("CollectionView offset: \(collectionView.contentOffset.x), pageCGFloat: \(pageCGFloat), pageIndexInt: \(pageIndexInt)")
    }
    
    private func updateCurrentItemTracking(item: Int) {
        let displayItem: Int = item + 1
        currentItemTrackingLabel.text = "\(displayItem)/\(items.count)"
    }
    
    private func updatePreviousButton(item: Int) {
        previousButton.isHidden = item == 0
    }
    
    private func updateNextButtonTitle(item: Int) {
        let title = item >= (items.count - 1) ? "Get Started" : "Next"
        nextButton.setTitle(title, for: .normal)
    }
    
    // MARK: - CollectionView DataSource
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
