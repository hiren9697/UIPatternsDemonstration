//
//  UIImage+Extension.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 04/04/25.
//

import UIKit

public extension UIImage {
    convenience init?(namedWithInBundle imageName: String) {
        self.init(named: imageName, in: Bundle(identifier:"hiren.ECommerceScreens"), with: nil)
    }
}
