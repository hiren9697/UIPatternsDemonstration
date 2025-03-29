//
//  WalkthroughVC.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit

public class WalkthroughVC: UIViewController {
    
    public init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required public init?(coder: NSCoder) {
        fatalError("WalkthroughVC is designed programmatically, it shouldn't be initialized from storyboard")
    }
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
