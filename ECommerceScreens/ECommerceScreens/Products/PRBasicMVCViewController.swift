//
//  ProductsVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 21/04/25.
//

import UIKit

public class PRBasicMVCViewController: UIViewController {
    let productLoader: ProductStore
    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        return refreshControl
    }()
    
    public init(productLoader: ProductStore) {
        self.productLoader = productLoader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        productLoader.loadProducts(completion: { _ in })
    }
    
    @objc func refresh() {
        productLoader.loadProducts(completion: { _ in })
    }
}
