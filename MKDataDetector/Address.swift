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
    
    public func extractAddresses(fromTextBody textBody: String) -> [AddressAnalysisResult]? {
        return extractData(fromTextBody: textBody, withResultTypes: [.address])
    }
    
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
