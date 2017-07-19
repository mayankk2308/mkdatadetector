//
//  Address.swift
//  MKDataDetector
//
//  Created by Mayank Kumar on 7/9/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation
import CoreLocation

extension MKDataDetectorService {
    
    /// Retrieves address components matched from a given body of text along with the range of each substring that matched.
    ///
    /// - Parameter textBody: A body of natural language text.
    /// - Returns: An array of `AddressAnalysisResult` instances or `nil` if no address components could be found.
    public func extractAddresses(fromTextBody textBody: String) -> [AddressAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultTypes: [.address])
    }
    
    /// Retrieves address componenets matched from the given bodies of text along with the range of each substring that matched.
    ///
    /// - Parameter textBodies: A set of multiple bodies of natural language text.
    /// - Returns: An array of `[AddressAnalysisResult]` instances or `nil` if no address components could be found.
    /// - Note: Inside the returned array, a non-empty `[AddressAnalysisResult]` instance is returned for each text body which contains a match.
    public func extractAddresses(fromTextBodies textBodies: [String]) -> [[AddressAnalysisResult]]? {
        return extractData(fromTextBodies: textBodies, withResultTypes: [.address])
    }
    
    public func extractLocation(fromAnalysisResult result: AddressAnalysisResult, onCompletion completion: @escaping (CLLocation?) -> Void) {
        extractLocation(fromAddress: result.source, onCompletion: completion)
    }
    
    public func extractLocation(fromAddress address: String, onCompletion completion: @escaping (CLLocation?) -> Void) {
        let geocoder = CLGeocoder()
        geocoder.geocodeAddressString(address) { placemarks, error in
            guard let location = self.extractLocation(fromPlacemarks: placemarks, withError: error) else { return }
            completion(location)
        }
    }
    
    internal func extractLocation(fromPlacemarks placemarks: [CLPlacemark]?, withError error: Error?) -> CLLocation? {
        if error == nil {
            guard let placemarks = placemarks, let placemark = placemarks.first else { return nil }
            return placemark.location
        }
        return nil
    }
}
