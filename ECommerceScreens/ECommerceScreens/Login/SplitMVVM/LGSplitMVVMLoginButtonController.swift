//
//  LoginMutlipleMVCsLoginButtonController.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 14/04/25.
//

import UIKit

class LGSplitMVVMLoginButtonController {
    let viewModel: LoginSplitMVVMLoginButtonViewModel
    
    lazy var view: ProgressButton = {
        let button = ProgressButton(title: "Login",
                                    titleColor: AppColors.cFFFFFF,
                                    backgroundColor: AppColors.cF83758,
                                    onClick: {[weak self] in
            self?.loginTap()
        })
        return button
    }()
    
    init(viewModel: LoginSplitMVVMLoginButtonViewModel){
        self.viewModel = viewModel
        bind()
    }
    
    @objc func loginTap() {
        viewModel.login()
    }
    
    private func bind() {
        viewModel.onLoadingChanged = {[weak self] isLoading in
            if isLoading {
                self?.view.showProgress()
            } else {
                self?.view.hideProgress()
            }
        }
    }
}
