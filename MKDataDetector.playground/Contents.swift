//: Playground

// Test below - delete tests before commits, or exclude this file in your commits
import MKDataDetector

let dataDetectorService = MKDataDetectorService()

let textBody = "hello world at 9pm tomorrow"

if let results = dataDetectorService.extractDates(withTextBody: textBody) {
    for result in results where result != nil {
        print(result!.source!)
        print(result!.data!)
    }
}