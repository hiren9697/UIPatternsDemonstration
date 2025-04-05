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
        let vc = WalkthroughMultipleMVCs(onFinish: { print("Finished Walkthrough") })
        navigationController?.pushViewController(vc, animated: true)
    }
}

