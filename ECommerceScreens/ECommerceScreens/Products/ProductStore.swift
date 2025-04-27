//
//  ProductStore.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 27/04/25.
//

import Foundation

public protocol ProductStore {
    typealias Completion = ([Product]) -> Void
    
    func loadProducts(completion: @escaping Completion)
}
