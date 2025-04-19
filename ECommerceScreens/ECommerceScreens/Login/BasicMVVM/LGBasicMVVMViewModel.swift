//
//  LGBasicMVVMViewModel.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 19/04/25.
//

import UIKit

class LGBasicMVVMViewModel {
    typealias Observer<T> = (T) -> Void
    typealias LoginCompletion = () -> Void
    
    private let service: LoginService
    private let loginCompletion: LoginCompletion
    
    init(service: LoginService,
         loginCompletion: @escaping LoginCompletion) {
        self.service = service
        self.loginCompletion = loginCompletion
    }
    
    public var onShowToast: Observer<ToastMessage>?
    public var onLoginProgressStateChange: Observer<Bool>?
    
    public func login(rawEmail: String?, rawPassword: String?) {
        switch LoginValidator.getValidInputs(email: rawEmail,
                                             password: rawPassword) {
        case .success(let inputData):
            onLoginProgressStateChange?(true)
            service.login(with: LoginServiceInputData(email: inputData.email, password: inputData.password),
                          completion: {[weak self] result in
                self?.onLoginProgressStateChange?(false)
                switch result {
                case .failure:
                    // self?.toast.present(message: ToastMessage(type: .failure, message: "Something went wrong"))
                    self?.onShowToast?(ToastMessage(type: .failure, message: "Something went wrong"))
                case .success:
                    self?.loginCompletion()
                }
            })
        case .failure(let error):
            onShowToast?(ToastMessage(type: .failure, message: error.localizedDescription))
        }
    }
}
