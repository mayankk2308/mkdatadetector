//
//  AnalysisResult.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

public struct AnalysisResult<T> {
    public var source: String?
    public var data: T?
}

public typealias PhoneNumberAnalysisResult = AnalysisResult<String>
public typealias DateAnalysisResult = AnalysisResult<Date>
public typealias URLAnalysisResult = AnalysisResult<URL>
public typealias AddressAnalysisResult = AnalysisResult<[String : String]>
public typealias TransitAnalysisResult = AnalysisResult<[String : String]>
