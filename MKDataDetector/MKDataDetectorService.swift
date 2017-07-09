//
//  MKDataDetectorService.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/8/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

public class MKDataDetectorService {
    
    private var textBodies = [String]()
    
    public init() {}
    
    public init(textBody: String) {
        textBodies.append(textBody)
    }
    
    public init(textBodies: [String]) {
        self.textBodies = textBodies
    }
    
    public func addTextBody(textBody: String) {
        textBodies.append(textBody)
    }
    
    public func addTextBodies(textBodies: [String]) {
        self.textBodies.append(contentsOf: textBodies)
    }
    
    public func reset() {
        textBodies.removeAll()
    }

}
