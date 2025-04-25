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
        /*
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
         */
        ///*
//        let vc = LoginVC(toast: FakeToast(),
//                         onForgotPasswordTap: {},
//                         service: FakeLoginService(),
//                         loginCompletion: {})
//        navigationController?.pushViewController(vc, animated: true)
         //*/
        
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

