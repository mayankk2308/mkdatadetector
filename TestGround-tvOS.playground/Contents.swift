// Test below - delete tests before commits, or exclude this file in your commits
import MKDataDetector
import CoreLocation
import UIKit

let dataDetectorService = MKDataDetectorService()

let textBody = "hello world at 9pm tomorrow"
let textBodies = ["event on monday", "movie on wednesday", "payment due next thursday", "time", "money", "yellowstone park visit next friday", "party next friday at 8pm"]

let address = "5123 Kere street, get here fast MA 01003, USA"
let legalAddress = "133 Belchertown Rd Amherst MA - 01003 United States"
let addresses = ["B713, Samartha Aangan II, Oshiwara, Andheri West, Mumbai - 400053, India", "133 Belchertown Rd Amherst MA - 01003 United States"]

let link = "Mayank's Github: https://github.com/mayankk2308"
let links = [link, "another link ://ssdsd", "testlink://", "www.apple.com", "http://apple.com"]

let phone = "Mayank: +1 (413) 801 6324"
let phones = ["+14138016324", "Mayank: +91 9920095040", "400053"]

let transit = "UA 2392"
let transits = ["Flight 2334", "EK 239 to Boston", "Emirates Airlines", "United Flight 2223"]

print("-----Single Body Date Results-----\n")
if let singleBodyDateResults = dataDetectorService.extractDates(fromTextBody: textBody) {
    for result in singleBodyDateResults {
        print(result.source)
        print(result.data)
        print()
    }
}

print("\n-----Multiple Bodies Date Results-----\n")

if let combinedDateResults = dataDetectorService.extractDates(fromTextBodies: textBodies) {
    for individualResults in combinedDateResults {
        for result in individualResults {
            print(result.source)
            print(result.data)
            print()
        }
    }
}

print("\n-----Single Body Address Results-----\n")

if let addressResults = dataDetectorService.extractAddresses(fromTextBody: address) {
    for result in addressResults {
        print(result.source)
        print(result.data)
        print()
    }
}

print("\n-----Multiple Bodies Address Results-----\n")

if let combinedAddressResults = dataDetectorService.extractAddresses(fromTextBodies: addresses) {
    for individualResults in combinedAddressResults {
        for result in individualResults {
            print(result.source)
            print(result.data)
            print()
        }
    }
}

print("\n-----Single Body URL Results-----\n")

if let URLResults = dataDetectorService.extractLinks(fromTextBody: link) {
    for result in URLResults {
        print(result.source)
        print(result.data)
        print()
    }
}

print("\n-----Multiple Bodies URL Results-----\n")

if let combinedURLResults = dataDetectorService.extractLinks(fromTextBodies: links) {
    for individualResults in combinedURLResults {
        for result in individualResults {
            print(result.source)
            print(result.data)
            print()
        }
    }
}

print("\n-----Single Body Phone Results-----\n")

if let phoneResults = dataDetectorService.extractPhoneNumbers(fromTextBody: phone) {
    for result in phoneResults {
        print(result.source)
        print(result.data)
        print()
    }
}

print("\n-----Multiple Bodies Phone Results-----\n")

if let combinedPhoneResults = dataDetectorService.extractPhoneNumbers(fromTextBodies: phones) {
    for individualResults in combinedPhoneResults {
        for result in individualResults {
            print(result.source)
            print(result.data)
            print()
        }
    }
}

print("\n-----Single Body Transit Results-----\n")

if let transitResults = dataDetectorService.extractTransitInformation(fromTextBody: transit) {
    for result in transitResults {
        print(result.source)
        print(result.data)
        print()
    }
}

print("\n-----Multiple Bodies Transit Results-----\n")

if let combinedTransitResults = dataDetectorService.extractTransitInformation(fromTextBodies: transits) {
    for individualResults in combinedTransitResults {
        for result in individualResults {
            print(result.source)
            print(result.data)
            print()
        }
    }
}

print("\n-----Basic Scenario Implementation Results-----\n")

print(textBody.dates!)
print(link.links!)
print(transit.transitInfo!)
print(address.addresses!)
print(phone.phoneNumbers!)

print("\n-----Mixed Request Results-----\n")

let mixedText = "Call Mayank on +1123456789 on 2017/13/12 at 5pm when you reach 990 Belchertown Rd, Amherst, MA - 01440 USA."

if let results = dataDetectorService.extractInformation(fromTextBody: mixedText, withResultTypes: .date, .address, .phoneNumber) {
    for result in results {
        switch result.dataType {
        case .date:
            let date = result.data as! Date
            print(date)
            break
        case .address:
            let address = result.data as! AddressInfo
            print(address)
            break
        case .phoneNumber:
            let phoneNumber = result.data as! String
            print(phoneNumber)
            break
        default:
            continue
        }
    }
}
