//
//  LoginMVVMComposer.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 17/04/25.
//

import Foundation

public class LoginMVVMComposer {
    public static func compose(toast: Toast,
                               onForgotPasswrdTap: @escaping LoginMVVM.ForgotPasswordCompletion,
                               service: LoginService,
                               loginCompletion: @escaping LoginMVVM.LoginCompletion) -> LoginMVVM {
        
        let vc = LoginMVVM(toast: toast,
                           onForgotPasswordTap: onForgotPasswrdTap)
        let loginButtonController: LoginButtonController = LoginButtonController(service: service,
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
