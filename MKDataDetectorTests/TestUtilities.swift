//
//  TestUtilities.swift
//  MKDataDetector
//
//  Created by Jeet Parte on 22/07/17.
//  Copyright © 2017 Mayank Kumar. All rights reserved.
//

import Foundation

func concatenate(_ stringArray: [String]) -> String {
    var string = ""
    for item in stringArray {
        string += item + ". "
    }
    return string
}
