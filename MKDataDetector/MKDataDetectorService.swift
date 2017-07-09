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
    
    public func analyze(withResultType type: ResultType) {
        switch type {
        case .address:
            break
        case .correction:
            break
        case .date:
            break
        case .grammar:
            break
        case .link:
            break
        case .phoneNumber:
            break
        case .replacement:
            break
        case .spelling:
            break
        case .transitInformation:
            break
        }
    }
    
}
