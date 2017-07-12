//
//  CoreKeys.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/11/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

public struct Address {
    public static let name = NSTextCheckingNameKey
    public static let city = NSTextCheckingCityKey
    public static let zip = NSTextCheckingZIPKey
    public static let street = NSTextCheckingStreetKey
    public static let country = NSTextCheckingCountryKey
    public static let phone = NSTextCheckingPhoneKey
    public static let jobTitle = NSTextCheckingJobTitleKey
    public static let state = NSTextCheckingStateKey
    public static let organization = NSTextCheckingOrganizationKey
}

public struct Transit {
    public static let airline = NSTextCheckingAirlineKey
    public static let flight = NSTextCheckingFlightKey
}
