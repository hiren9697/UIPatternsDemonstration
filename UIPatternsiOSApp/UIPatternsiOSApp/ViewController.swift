//
//  ViewController.swift
//  UIPatternsiOSApp
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit
import ECommerceScreens

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnTap() {
        let vc = WalkthroughMultipleMVCsComposer.compose(items: [WalkthroughItem(image: UIImage(namedWithInBundle: "ic_walkthrough_item_1")!,
                                                                                 title: "Choose Products",
                                                                                 subtitle: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
                                                                 WalkthroughItem(image: UIImage(namedWithInBundle: "ic_walkthrough_item_2")!,
                                                                                 title: "Make Payment",
                                                                                 subtitle: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit."),
                                                                 WalkthroughItem(image: UIImage(namedWithInBundle: "ic_walkthrough_item_3")!,
                                                                                 title: "Get Your Order",
                                                                                 subtitle: "Amet minim mollit non deserunt ullamco est sit aliqua dolor do amet sint. Velit officia consequat duis enim velit mollit.")],
                                                         onFinish: { print("Finished walkthrough")})
        navigationController?.pushViewController(vc, animated: true)
    }
}

