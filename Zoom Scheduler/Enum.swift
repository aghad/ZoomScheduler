//
//  Enum.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/21/21.
//

import Foundation
import UIKit


enum Padding {
    static let topPadding: CGFloat = 50
    static let leading: CGFloat = 20
    static let top: CGFloat = 10
    static let spacing: CGFloat = 20
    static let lineSpacing: CGFloat = 8
    static let width: CGFloat = UIScreen.main.bounds.width / 3
    static let moreSize: CGFloat = 50
    static let addSize: CGFloat = 80
    static let height: CGFloat = 35
    static let textFieldHeight: CGFloat = 50
}


// field name
enum TextFieldNodeName: String {
    case meetingName = "Meeting name"
    case meetingURL = "Meeting URL"
    case professorName = "Professor Name"
}

// field name
enum PickerViewNodeName: String {
    case day = "Day"
    case startTime = "Start Time"
    case endTime = "End Time"
}


// error to display
enum TextFieldNodeError: String {
    case meetingName = "Meeting name is required."
    case meetingURL = "Meeting URL is required."
    case professorName = "Professor name is required."
}
// error to display
enum PickerViewNodeError: String {
    case day = "Please select meeting day."
    case startTime = "Please select meeting start time."
    case endTime = "Please select meeting end time."
}


// ask for this type of input
enum FieldNodePrompt: String {
    case meetingName = "Enter meeting name"
    case meetingURL = "Eneter meeting URL"
    case day = "Select meeting day"
    case startTime = "Select start time"
    case endTime = "Select end time"
    case professorName = "Enter professor name"
}
