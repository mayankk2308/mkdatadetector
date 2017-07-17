//
//  AnalysisResult.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/10/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

public protocol AnalysisData {}

extension String: AnalysisData {}
extension Date: AnalysisData {}
extension URL: AnalysisData {}
extension Dictionary: AnalysisData {}

public struct AnalysisResult<T> {
    public var source: String
    public var rangeInSource: NSRange
    public var dataString: String
    public var dataType: ResultType
    public var data: T
}

public typealias AddressInfo = Dictionary<String, String>
public typealias TransitInfo = Dictionary<String, String>
public typealias PhoneNumberAnalysisResult = AnalysisResult<String>
public typealias DateAnalysisResult = AnalysisResult<Date>
public typealias URLAnalysisResult = AnalysisResult<URL>
public typealias AddressAnalysisResult = AnalysisResult<AddressInfo>
public typealias TransitAnalysisResult = AnalysisResult<TransitInfo>
public typealias GenericAnalysisResult = AnalysisResult<AnalysisData>
