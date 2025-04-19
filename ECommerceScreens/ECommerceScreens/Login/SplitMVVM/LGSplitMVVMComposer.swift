//
//  LoginMVVMComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 17/04/25.
//

import Foundation

public class LGSplitMVVMComposer {
    public static func compose(toast: Toast,
                               onForgotPasswrdTap: @escaping LGSplitMVVMLoginButtonViewController.ForgotPasswordCompletion,
                               service: LoginService,
                               loginCompletion: @escaping LGSplitMVVMLoginButtonViewController.LoginCompletion) -> LGSplitMVVMLoginButtonViewController {
        let vc = LGSplitMVVMLoginButtonViewController(toast: toast,
                           onForgotPasswordTap: onForgotPasswrdTap)
        let loginButtonVM = LoginSplitMVVMLoginButtonViewModel(service: service,
                                                   loginCompletion: loginCompletion,
                                                   showToast: {[weak vc] message in
            vc?.showToast(message: message)
        }, getRawInputs: {[weak vc] in
            vc?.rawInputs()
        })
        let loginButtonController = LGSplitMVVMLoginButtonController(viewModel: loginButtonVM)
        vc.loginButtonController = loginButtonController
        return vc
    }
}
