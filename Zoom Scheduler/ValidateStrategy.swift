//
//  ValidateStrategy.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/28/21.
//
import Foundation

// type of strategy
protocol ValidateStrategy {
    func validate(_ meeting: ZoomMeeting) -> Bool
}


// light weight class to instantiate - declare what strategy we need
// let strategy pattern handle validate function
struct Validate {
    let strategy: ValidateStrategy
    
    func validate(_ meeting: ZoomMeeting) -> Bool {
        return strategy.validate(meeting)
    }
}

// validate string inputs like meeting name and professor name
struct StringValidation: ValidateStrategy {
    func validate(_ meeting: ZoomMeeting) -> Bool {
        if meeting.meetingName != "" && meeting.professorName != "" { //check string is not empty
            return true
        }
        return false
    }
}


// validate url before saving it
struct URLValidation: ValidateStrategy {
    func validate(_ meeting: ZoomMeeting) -> Bool {
        if let url = createURL(url: meeting.meetingURL!){ //check URL can be opened
            return isURlValid(url: url)
        }
        return false
    }
}

// make sure start and end times are valid
struct TimeValidation: ValidateStrategy {
    func validate(_ meeting: ZoomMeeting) -> Bool {
        return meeting.startTime < meeting.endTime ? true : false //check start time is before end time
    }
}

// make sure day input is one of 7 days
struct DayValidation: ValidateStrategy {
    func validate(_ meeting: ZoomMeeting) -> Bool {
        if weekDays[meeting.dayOfWeek] != nil {
            return true
        }
        else {
            return false
        }
    }
}

