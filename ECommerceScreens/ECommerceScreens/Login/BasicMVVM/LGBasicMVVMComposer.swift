//
//  LGBasicMVVMComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 19/04/25.
//

import UIKit

struct LGBasicMVVMComposer {
    static func compose(toast: Toast,
                        onForgotPasswordTap: @escaping LGBasicMVVMViewController.ForgotPasswordCompletion,
                        service: LoginService,
                        loginCompletion: @escaping LGBasicMVVMViewController.LoginCompletion) -> LGBasicMVVMViewController {
        let viewModel = LGBasicMVVMViewModel(service: service,
                                             loginCompletion: loginCompletion)
        let viewController = LGBasicMVVMViewController(toast: toast,
                                                       onForgotPasswordTap: onForgotPasswordTap,
                                                       viewModel: viewModel)
        return viewController
    }
}
