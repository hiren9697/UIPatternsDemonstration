//
//  LoginService.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 13/04/25.
//

import Foundation

public protocol LoginService {
    typealias Completion = (Result<Void, Error>) -> Void
    func login(with data: LoginServiceInputData, completion: @escaping Completion)
}