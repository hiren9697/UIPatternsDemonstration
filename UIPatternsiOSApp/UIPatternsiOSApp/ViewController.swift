//
//  ViewController.swift
//  UIPatternsiOSApp
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit
import ECommerceScreens

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    
    let loader = Loader()

    override func viewDidLoad() {
        super.viewDidLoad()
        loader.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(loader)
        loader.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loader.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @IBAction func btnTap() {
        loader.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + 3,
                                      execute: {
            self.loader.hide()
        })
    }
}



