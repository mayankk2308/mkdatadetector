//
//  TestUtilities.swift
//  MKDataDetector
//
//  Created by Jeet Parte on 22/07/17.
//  Copyright © 2017 Mayank Kumar. Available under the MIT license.
//

import Foundation

func concatenate(_ stringArray: [String]) -> String {
    var string = ""
    for item in stringArray {
        string += item + ". "
    }
    return string
}
