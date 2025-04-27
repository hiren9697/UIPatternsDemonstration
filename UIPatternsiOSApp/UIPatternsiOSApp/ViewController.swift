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
        loader.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        loader.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        loader.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        loader.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    @IBAction func btnTap() {
        loader.show(withOverlay: true)
        DispatchQueue.main.asyncAfter(deadline: .now() + 3,
                                      execute: {
            self.loader.hide()
        })
    }
}



