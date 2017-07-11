//: Playground

// Test below - delete tests before commits, or exclude this file in your commits
import MKDataDetector

let dataDetectorService = MKDataDetectorService()

let textBody = "hello world at 9pm tomorrow"
let textBodies = ["event on monday", "movie on wednesday", "payment due next thursday", "time", "money", "yellowstone park visit next friday", "party next friday at 8pm"]
let address = "amherst, MA 01003, USA"

//if let results = dataDetectorService.extractDates(withTextBody: textBody) {
//    for result in results where result != nil {
//        print(result!.source!)
//        print(result!.data!)
//    }
//}
//
//if let combinedResults = dataDetectorService.extractDates(withTextBodies: textBodies) {
//    for individualResults in combinedResults where individualResults != nil {
//        for result in individualResults! where result != nil {
//            print(result!.source!)
//            print(result!.data!)
//            // do some stuff
//        }
//    }
//}

if let results = dataDetectorService.extractAddresses(withTextBody: address) {
    for result in results {
        print(result!.source!)
        print(result!.data!)
    }
}

//func dictionary<T>(dict: T) {
//    print(dict)
//}
//
//dictionary(dict: ["hello" : "world"])
