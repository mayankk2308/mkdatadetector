//
//  ResultType.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/11/17.
//  Copyright 2017 Mayank Kumar. Available under the MIT license.
//

/// Defines the types of detectable results that are available.
public enum ResultType {
    
    /// Attempts to locate dates.
    case date
    
    /// Attempts to locate addresses.
    case address
    
    /// Attempts to locate URL links.
    case link
    
    /// Attempts to locate phone numbers.
    case phoneNumber
    
    /// Attempts to locate transit information.
    case transitInformation
}
