//: Playground

// Test below - delete tests before commits, or exclude this file in your commits
import MKDataDetector

let dataDetectorService = MKDataDetectorService()

let textBody = "hello world at 9pm tomorrow"
let textBodies = ["event on monday", "movie on wednesday", "payment due next thursday", "time", "money", "yellowstone park visit next friday", "party next friday at 8pm"]
let address = "5123 Kere street, get here fast MA 01003, USA"
let link = "Mayank's Github: https://github.com/mayankk2308"
let transit = "American Airlines 2392"

//if let results = dataDetectorService.extractDates(fromTextBody: textBody) {
//    for result in results where result != nil {
//        print(result!.source!)
//        print(result!.data!)
//    }
//}
//
//if let combinedResults = dataDetectorService.extractDates(fromTextBodies: textBodies) {
//    for individualResults in combinedResults where individualResults != nil {
//        for result in individualResults! where result != nil {
//            print(result!.source!)
//            print(result!.data!)
//            // do some stuff
//        }
//    }
//}

//if let results = dataDetectorService.extractAddresses(fromTextBody: address) {
//    for result in results {
//        print(result!.source!)
//        print(result!.data!)
//    }
//}

//if let results = dataDetectorService.extractLinks(fromTextBody: link) {
//    for result in results {
//        print(result!.source!)
//        print(result!.data!)
//    }
//}

//if let results = dataDetectorService.extractTransitInformation(fromTextBody: transit) {
//    for result in results {
//        print(result!.source!)
//        print(result!.data!)
//    }
//}
