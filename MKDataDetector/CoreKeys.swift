//
//  CoreKeys.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/11/17.
//  Copyright 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

/// Stores address-related keys for convenient access to an address dictionary (i.e. `AddressInfo` inside an `AddressAnalysisResult`)
public struct Address {
    
    /// A key that corresponds to the city component of the address.
    public static let city = NSTextCheckingKey.city
    
    /// A key that corresponds to the zip code or postal code component of the address.
    public static let zip = NSTextCheckingKey.zip
    
    /// A key that corresponds to the street address component of the address.
    public static let street = NSTextCheckingKey.street
    
    /// A key that corresponds to the country component of the address.
    public static let country = NSTextCheckingKey.country
    
    /// A key that corresponds to the state or province component of the address.
    public static let state = NSTextCheckingKey.state

    // MARK:- Keys for which detection is unavailable in the original NSDataDetector API:
    
//    /// A key that corresponds to the name component of the address.
//    public static let name = NSTextCheckingNameKey
    
    
//    /// A key that corresponds to the phone number component of the address.
//    public static let phone = NSTextCheckingPhoneKey
    
//    /// A key that corresponds to the job component of the address.
//    public static let jobTitle = NSTextCheckingJobTitleKey
    
    
//    /// A key that corresponds to the organization component of the address.
//    public static let organization = NSTextCheckingOrganizationKey
}

/// Stores transit-related keys for convenient access to a transit dictionary (i.e. `TransitInfo` inside a `TransitAnalysisResult`
public struct Transit {
    
    /// A key that corresponds to the flight component of a transit result.
    public static let flight = NSTextCheckingKey.flight

    //Keys for which detection is unavailable in the original NSDataDetector API:

//    /// A key that corresponds to the airline of a transit result.
//    public static let airline = NSTextCheckingAirlineKey
    
}
