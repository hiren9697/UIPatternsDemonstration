//
//  ProductsVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 21/04/25.
//

import UIKit

public class PRBasicMVCViewController: UIViewController {
    let loader: ProductStore
    
    public init(loader: ProductStore) {
        self.loader = loader
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func viewIsAppearing(_ animated: Bool) {
        super.viewIsAppearing(animated)
        loader.loadProducts(completion: { _ in })
    }
}
