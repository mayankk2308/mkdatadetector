//
//  MixedType.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/11/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

extension MKDataDetectorService {
    
    public func extractData(fromTextBody textBody: String, withTypes types: ResultType ...) -> [MixedDataAnalysisResult?]? {
        return extractData(fromTextBody: textBody, withResultTypes: types)
    }
    
}
