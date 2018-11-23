//
//  AppResource.swift
//  Cooking
//
//  Created by Tien Le on 11/20/18.
//  Copyright © 2018 Tienle. All rights reserved.
//

import Foundation

class AppResource : NSObject {
    private static var m_bundle : Bundle?
    static var bundle : Bundle {
        get {
            if (nil == m_bundle) {
                let bundlePath = Bundle.main.path(forResource: "Resources", ofType: "bundle")
                m_bundle = Bundle.init(path: bundlePath!)
            }
            return m_bundle!
        }
    }
    
    static let shared = AppResource()
    
    private override init() {

    }
}
