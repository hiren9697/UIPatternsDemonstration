//
//  ProductsVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 21/04/25.
//

import UIKit

public class PRBasicMVCViewController: UIViewController {
    public init(loader: ProductStore) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
