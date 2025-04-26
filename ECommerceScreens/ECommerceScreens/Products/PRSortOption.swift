//
//  PRSortOption.swift
//  ECommerceScreens
//
//  Created by Hirenkumar Fadadu on 23/04/25.
//

import Foundation

public enum PRSortOption {
    case lowToHigh
    case highToLow
    
    public var title: String {
        switch self {
        case .lowToHigh: "Low to High"
        case .highToLow: "High to Low"
        }
    }
}
