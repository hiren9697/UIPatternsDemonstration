//
//  WalkthroughItem.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 29/03/25.
//

import UIKit

public struct WalkthroughItem {
    let image: UIImage
    let title: String
    let subtitle: String
    
    public init(image: UIImage, title: String, subtitle: String) {
        self.image = image
        self.title = title
        self.subtitle = subtitle
    }
}
