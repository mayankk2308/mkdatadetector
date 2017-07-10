//
//  MKDataDetectorService.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/8/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

public class MKDataDetectorService {
    
    public init() {}
    
    func extractSource(fromTextBody textBody: String, usingRange range: NSRange) -> String {
        return (textBody as NSString).substring(with: range)
    }

}
