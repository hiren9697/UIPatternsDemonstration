//
//  XCTestCase+TrackingMemoryHelper.swift
//  ECommerceScreensTests
//
//  Created by Hirenkumar Fadadu on 03/04/25.
//

import XCTest

extension XCTestCase {
    func trackMemory(for object: AnyObject,
                     file: StaticString = #filePath,
                     line: UInt = #line) {
        addTeardownBlock {[weak object] in
            XCTAssertNil(object,
                         "Instance should have been deallocated. Potential memory leak: \(String(describing: object))",
                         file: file,
                         line: line)
        }
    }
    
}
