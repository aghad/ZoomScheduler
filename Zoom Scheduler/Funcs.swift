//
//  Funcs.swift
//  Zoom Scheduler
//
//  Created by Aden on 2/22/21.
//

import Foundation
import UIKit
import RealmSwift

//crud
// create read update delete functions within realm
extension Realm {
    func addMeeting(_ meeting: ZoomMeeting) {
        do {
            try self.write {
                self.add(meeting)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteMeeting(_ meeting: ZoomMeeting) {
        do {
            try self.write {
                self.delete(meeting)
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func deleteRealm() {
        do {
            try! self.write {
                self.deleteAll()
            }
        }
    }
}

func createURL(url: String) -> URL? {
    // allow special characters
    guard let escapedUrlStr = url.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else { return nil }
    // return string as URL representaion
    return URL(string: escapedUrlStr)
}

func isURlValid(url: URL) -> Bool {
    var isValid = UIApplication.shared.canOpenURL(url as URL)
    return isValid
}

func addHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .medium) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.prepare()
    generator.impactOccurred()
}

func isStringValid(str: String) -> Bool {
return str.count > 0 ? true : false
}

func isTimeSelectionValid(time1: Int, time2: Int) -> Bool {
    if timeMapto[time1] != nil && timeMapto[time2] != nil {
        return time1 < time2 ? true : false
    } else {
        return false
    }
}

// convert string to Date components
func getComponents(meeting: ZoomMeeting) -> (day: Int?, hour: Int?, minute: Int?) {
    if let inputStr = timeMapto[meeting.startTime] {
    let dateFormatter = DateFormatter()
    dateFormatter.locale = Locale(identifier: "en-US")
    // hour, minute am/pm
    dateFormatter.dateFormat = "h:mm a"
        guard let date = dateFormatter.date(from: inputStr) else { return (nil, nil, nil) }
    //let str = dateFormatter.string(from: date)
    let calendar = NSCalendar.autoupdatingCurrent
    
    let hour = calendar.component(.hour, from: date)
    let minute = calendar.component(.minute, from: date)
        guard let weekDay = weekDays[meeting.dayOfWeek] else { return (nil, nil, nil) }
    let day = appleWeekdayMap[weekDay]
    
    return (day, hour, minute)
    } else {
        return (nil, nil, nil)
    }
}
