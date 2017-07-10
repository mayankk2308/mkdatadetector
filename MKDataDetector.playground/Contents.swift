//: Playground

// Test below - delete tests before commits, or exclude this file in your commits
import MKDataDetector

let dataDetectorService = MKDataDetectorService()
if let results = dataDetectorService.extractDates(withTextBody: "hello 7pm") {
    for result in results {
        
    }
}