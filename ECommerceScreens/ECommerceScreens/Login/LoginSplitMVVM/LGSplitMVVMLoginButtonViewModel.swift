//
//  LoginMVVMLoginButtonVM.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 17/04/25.
//

import Foundation

class LoginSplitMVVMLoginButtonViewModel {
    public typealias ShowToast = (ToastMessage) -> Void
    public typealias GetRawInputs = () -> (String?, String?)?
    
    let service: LoginService
    let loginCompletion: LGSplitMVCLoginViewController.LoginCompletion
    var showToast: (ToastMessage) -> Void
    var getRawInputs: () -> (email: String?, password: String?)?
    var onLoadingChanged: ((Bool) -> Void)?
    
    init(service: LoginService,
         loginCompletion: @escaping LGSplitMVCLoginViewController.LoginCompletion,
         showToast: @escaping ShowToast,
         getRawInputs: @escaping GetRawInputs){
        self.service = service
        self.loginCompletion = loginCompletion
        self.showToast = showToast
        self.getRawInputs = getRawInputs
    }
    
    @objc func login() {
        guard let inputs = getRawInputs() else {
            showToast(ToastMessage(type: .failure, message: "Something went wrong"))
            return
        }
        switch LoginValidator.getValidInputs(email: inputs.email,
                                             password: inputs.password) {
        case .success(let inputData):
            // view.showProgress()
            onLoadingChanged?(true)
            service.login(with: LoginServiceInputData(email: inputData.email, password: inputData.password),
                          completion: {[weak self] result in
                self?.onLoadingChanged?(false)
                // self?.view.hideProgress()
                switch result {
                case .failure:
                    // self?.toast.present(message: ToastMessage(type: .failure, message: "Something went wrong"))
                    self?.showToast(ToastMessage(type: .failure, message: "Something went wrong"))
                case .success:
                    self?.loginCompletion()
                }
            })
        case .failure(let error):
            // toast.present(message: ToastMessage(type: .failure, message: error.localizedDescription))
            showToast(ToastMessage(type: .failure, message: error.localizedDescription))
        }
    }
}
