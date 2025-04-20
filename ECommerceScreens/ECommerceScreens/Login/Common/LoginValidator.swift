//
//  LoginValidator.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 13/04/25.
//

import Foundation

struct LoginValidator {
    enum Error: Swift.Error, LocalizedError {
        case emptyEmail
        case invalidEmail
        case emptyPassword
        case unexpected
        
        var errorDescription: String? {
            switch self {
            case .emptyEmail:
                return "Please enter email"
            case .invalidEmail:
                return "Please enter a valid email"
            case .emptyPassword:
                return "Please enter password"
            case .unexpected:
                return "Something went wrong"
            }
        }
    }
    
    static func getValidInputs(email: String?,
                               password: String?) -> Result<(email: String, password: String),
                                                            Self.Error> {
        guard let email = email,
              let password = password else {
            return .failure(Self.Error.unexpected)
        }
        
        if email.isEmpty {
            return .failure(Self.Error.emptyEmail)
        } else if !isValidEmail(email) {
            return .failure(Self.Error.invalidEmail)
        } else if password.isEmpty {
            return .failure(Self.Error.emptyPassword)
        } else {
            return .success((email, password))
        }
    }
    
    private static func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
}
