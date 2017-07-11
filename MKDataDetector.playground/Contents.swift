//: Playground

// Test below - delete tests before commits, or exclude this file in your commits
import MKDataDetector

let dataDetectorService = MKDataDetectorService()

let textBody = "hello world at 9pm tomorrow"
let textBodies = ["event on monday", "movie on wednesday", "payment due next thursday", "time", "money", "yellowstone park visit next friday", "party next friday at 8pm"]

let address = "5123 Kere street, get here fast MA 01003, USA"
let addresses = ["B713, Samartha Aangan II, Oshiwara, Andheri West, Mumbai - 400053, India", "133 Belchertown Rd Amherst MA - 01003 United States"]

let link = "Mayank's Github: https://github.com/mayankk2308"
let links = [link, "another link ://ssdsd", "testlink://", "www.apple.com", "http://apple.com"]

let transit = "UA 2392"

print("-----Single Body Date Results-----\n")
if let singleBodyDateResults = dataDetectorService.extractDates(fromTextBody: textBody) {
    for result in singleBodyDateResults where result != nil {
        print(result!.source!)
        print(result!.data!)
        print()
    }
}

print("\n-----Multiple Bodies Date Results-----\n")

if let combinedDateResults = dataDetectorService.extractDates(fromTextBodies: textBodies) {
    for individualResults in combinedDateResults where individualResults != nil {
        for result in individualResults! where result != nil {
            print(result!.source!)
            print(result!.data!)
            print()
        }
    }
}

print("\n-----Single Body Address Results-----\n")

if let addressResults = dataDetectorService.extractAddresses(fromTextBody: address) {
    for result in addressResults {
        print(result!.source!)
        print(result!.data!)
        print()
    }
}

print("\n-----Multiple Bodies Address Results-----\n")

if let combinedAddressResults = dataDetectorService.extractAddresses(fromTextBodies: addresses) {
    for individualResults in combinedAddressResults where individualResults != nil {
        for result in individualResults! where result != nil {
            print(result!.source!)
            print(result!.data!)
            print()
        }
    }
}

print("\n-----Single Body URL Results-----\n")

if let URLResults = dataDetectorService.extractLinks(fromTextBody: link) {
    for result in URLResults {
        print(result!.source!)
        print(result!.data!)
        print()
    }
}

print("\n-----Multiple Bodies URL Results-----\n")

if let combinedURLResults = dataDetectorService.extractLinks(fromTextBodies: links) {
    for individualResults in combinedURLResults where individualResults != nil {
        for result in individualResults! where result != nil {
            print(result!.source!)
            print(result!.data!)
            print()
        }
    }
}