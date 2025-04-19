//
//  LoginMultipleMVCsComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 15/04/25.
//

import UIKit

public class LGSplitMVCComposer {
    public static func compose(toast: Toast,
                               onForgotPasswrdTap: @escaping LGSplitMVCViewController.ForgotPasswordCompletion,
                               service: LoginService,
                               loginCompletion: @escaping LGSplitMVCViewController.LoginCompletion) -> LGSplitMVCViewController {
        
        let vc = LGSplitMVCViewController(toast: toast,
                                   onForgotPasswordTap: onForgotPasswrdTap)
        let loginButtonController: LGSplitMVCLoginButtonController = LGSplitMVCLoginButtonController(service: service,
                                                                                 loginCompletion: loginCompletion,
                                                                                 showToast: {[weak vc] message in
            vc?.showToast(message: message)
        },
                                                                                 getRawInputs: {[weak vc] in
            vc?.rawInputs()
        })
        vc.loginButtonController = loginButtonController
        return vc
    }
}
