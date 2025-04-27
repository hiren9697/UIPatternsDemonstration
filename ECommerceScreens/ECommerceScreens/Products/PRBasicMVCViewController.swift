//
//  ProductsVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 21/04/25.
//

import UIKit

public class PRBasicMVCViewController: UIViewController {
    let loadingView = Loader()
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    let productLoader: ProductStore
    // var onViewIsAppearing: (() -> Void)?
    
    public init(productLoader: ProductStore) {
        self.productLoader = productLoader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        loadProducts(shouldShowLoadingIndicator: true)
    }
    
    @objc func refresh() {
        loadProducts(shouldShowLoadingIndicator: false)
    }
    
    private func loadProducts(shouldShowLoadingIndicator: Bool) {
        if shouldShowLoadingIndicator {
            loadingView.show()
        }
        productLoader.loadProducts(completion: {[weak self] _ in
            self?.loadingView.hide()
            self?.refreshControl.endRefreshing()
        })
    }
}
