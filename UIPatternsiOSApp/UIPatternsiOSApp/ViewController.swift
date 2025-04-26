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
    
    lazy var progressButton: ProgressButton = {
        let button = ProgressButton(title: "TEst",
                                    titleColor: .white,
                                    backgroundColor: .systemPink,
                                    onClick: {
            print("Hello there")
        })
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        progressButton.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(progressButton)
        progressButton.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        progressButton.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        progressButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        progressButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
    }
    
    @IBAction func btnTap() {
        _ = PRSortViewComposer.compose(selectedSortOption: nil,
                                       parentView: self.view,
                                       completion: { selectedOption in
            
        })
    }
}

class FakeToast: Toast {
    func present(message: ToastMessage) {
        // Do nothing
    }
}

class FakeLoginService: LoginService {
    func login(with data: LoginServiceInputData, completion: @escaping Completion) {
        // Do nothing
    }
}

