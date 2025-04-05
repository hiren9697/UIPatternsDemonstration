//
//  WalkthroughCCController.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 05/04/25.
//

import UIKit

public class WalkthroughCCController {
    let model: WalkthroughItem
    
    init(model: WalkthroughItem) {
        self.model = model
    }
    
    public func configuare(cell: WalkthroughCC) -> WalkthroughCC {
        cell.imageView.image = model.image
        cell.titleLabel.text = model.title
        cell.subtitleLabel.text = model.subtitle
        return cell
    }
}
