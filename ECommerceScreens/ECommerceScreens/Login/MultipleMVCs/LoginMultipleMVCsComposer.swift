//
//  LoginMultipleMVCsComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 15/04/25.
//

import UIKit

public class LoginMultipleMVCsComposer {
    public static func compose(toast: Toast,
                               onForgotPasswrdTap: @escaping LoginMultipleMVCs.ForgotPasswordCompletion,
                               service: LoginService,
                               loginCompletion: @escaping LoginMultipleMVCs.LoginCompletion) -> LoginMultipleMVCs {
        
        let vc = LoginMultipleMVCs(toast: toast,
                                   onForgotPasswordTap: onForgotPasswrdTap)
        let loginButtonController: LoginMultipleMVCsLoginButtonController = LoginMultipleMVCsLoginButtonController(service: service,
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
