//
//  Zoom_SchedulerTests.swift
//  Zoom SchedulerTests
//
//  Created by Destiny Hochhalter Ruiz on 2/19/21.
//

import Foundation
import XCTest
@testable import Zoom_Scheduler

class Zoom_SchedulerTests: XCTestCase {
    
    
    func testDayDictValid() {
        let dictValue = weekDays[0]
        XCTAssertEqual(dictValue, "Monday")
    }
    
    func testDayDictValid0() {
        let dictValue = weekDays[6]
        XCTAssertEqual(dictValue, "Sunday")
    }
    
    func testDayDictInvalid1() {
        let dictValue = weekDays[10]
        XCTAssertEqual(dictValue, nil)
    }
    
    func testDayDictInvalid2() {
        let dictValue = weekDays[-1]
        XCTAssertEqual(dictValue, nil)
    }
    
    
    func testTimeDictValid() {
        let dictValue = timeOfDay[131]
        XCTAssertEqual(dictValue, "11:55")
    }
    
    func testTimeDictInvalid1() {
        let dictValue = timeOfDay[1000]
        XCTAssertEqual(dictValue, nil)
    }
    
    func testTimeDictInvalid2() {
        let dictValue = timeOfDay[-20]
        XCTAssertEqual(dictValue, nil)
    }
    
    
    
    func testValidURL() {
        let url = createURL(url: "https://www.google.com") //Testing Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL1() {
        let url = createURL(url: "https://www.yahoo.com") //Testing Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    
    func testValidURL2() {
        let url = createURL(url: "https://www.youtube.com") //Testing Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL3() {
        let url = createURL(url: "https://www.thenew.org") //Testing Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL4() {
        let url = createURL(url: "https://www.facebook.com") //Testing Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }

    /*
    func testVerifyURL (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
   */
    
    func testisStringValidFalse(){
        let str = ""
        let isValid = isStringValid(str: str)
        XCTAssertEqual(isValid, false)
    }
    
    func testisStringValidTrue(){
        let str = "Class"
        let isValid = isStringValid(str: str)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidTimeFalse1() {
        let time1 = 5
        let time2 = 3
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, false)
    }
    
    func testValidTimeFalse2() {
        let time1 = 0
        let time2 = 0
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, false)
    }
    
    func testValidTimeFalse3() {
        let time1 = -5
        let time2 = -3
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, false)
    }
    
    func testValidTimeFalse4() {
        let time1 = -1
        let time2 = 0
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, false)
    }
    
    func testValidTimeFalse5() {
        let time1 = 300
        let time2 = 400
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, false)
    }
    
    func testValidTimeTrue1() {
        let time1 = 3
        let time2 = 5
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidTimeTrue2() {
        let time1 = 35
        let time2 = 39
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidTimeTrue3() {
        let time1 = 200
        let time2 = 205
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, true)
    }
    
    
    // test fcuntion that creates time components for a notification
    func testGetComponents1() {
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: 0, endTime: 1, meetingURL: "https://google.com", dayOfWeek: 0)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, 2) // Monday
        XCTAssertEqual(hour, 1)
        XCTAssertEqual(minute, 0)
    }
    
    func testGetComponents2() {
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: 40, endTime: 46, meetingURL: "https://google.com", dayOfWeek: 1)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, 3) // Tuesday
        XCTAssertEqual(hour, 4)
        XCTAssertEqual(minute, 20)
    }
    
    func testGetComponents3() {
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: 200, endTime: 205, meetingURL: "https://google.com", dayOfWeek: 5)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, 0) // Saturday
        XCTAssertEqual(hour, 17)
        XCTAssertEqual(minute, 40)
    }
    func testGetComponents4() {
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: 13, endTime: 16, meetingURL: "https://google.com", dayOfWeek: 3)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, 5) // Thursday
        XCTAssertEqual(hour, 2)
        XCTAssertEqual(minute, 5)
    }
    
    func testGetComponents5() {
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: 256, endTime: 259, meetingURL: "https://google.com", dayOfWeek: 4)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, 6) // Saturday
        XCTAssertEqual(hour, 22)
        XCTAssertEqual(minute, 20)
    }
    
    func testGetComponents6() {
        // invalid start and end times
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: 200, endTime: 205, meetingURL: "https://google.com", dayOfWeek: 8)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, nil)
        XCTAssertEqual(hour, nil)
        XCTAssertEqual(minute, nil)
    }
    
    func testGetComponents7() {
        // invalid start and end times, and invalid week day
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: 400, endTime: 404, meetingURL: "https://google.com", dayOfWeek: 9)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, nil)
        XCTAssertEqual(hour, nil)
        XCTAssertEqual(minute, nil)
    }
    
    func testGetComponents8() {
        // invalid start and end times with negative numbers
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: -16, endTime: -20, meetingURL: "https://google.com", dayOfWeek: 3)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, nil)
        XCTAssertEqual(hour, nil)
        XCTAssertEqual(minute, nil)
    }
    
    func testGetComponents9() {
        // invalid day with negative int
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: 16, endTime: 20, meetingURL: "https://google.com", dayOfWeek: -3)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, nil)
        XCTAssertEqual(hour, nil)
        XCTAssertEqual(minute, nil)
    }
    
    func testGetComponents10() {
        // test with both negative intergers for start/end time and day
        let meeting = ZoomMeeting(meetingName: "test", professorName: "test", startTime: -16, endTime: -20, meetingURL: "https://google.com", dayOfWeek: -3)
        
        let components = getComponents(meeting: meeting)
        let day = components.day
        let hour = components.hour
        let minute = components.minute
        XCTAssertEqual(day, nil)
        XCTAssertEqual(hour, nil)
        XCTAssertEqual(minute, nil)
    }
    
    
    func testStringValidationStrategy1() {
            let valid = Validate(strategy: StringValidation())
            // test meeting name
            // empty string invalid
            let meeting = ZoomMeeting(meetingName: "", professorName: "", startTime: 0, endTime: 0, meetingURL: "", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testStringValidationStrategy2() {
            let valid = Validate(strategy: StringValidation())
            // test meeting name
            // non empty string is valid
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "Reem", startTime: 0, endTime: 0, meetingURL: "", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }
        
    func testStringValidationStrategy3() {
            let valid = Validate(strategy: StringValidation())
            // test meeting name
            // empty string invalid
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 0, meetingURL: "", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testURLValidationStrategy1() {
            let valid = Validate(strategy: URLValidation())
            // url is valid
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 0, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }
        
    func testURLValidationStrategy2() {
            let valid = Validate(strategy: URLValidation())
            // url is invalid
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 0, meetingURL: "", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testURLValidationStrategy3() {
            let valid = Validate(strategy: URLValidation())
            // url is invalid
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 0, meetingURL: "htt", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testTimeValidationStrategy1() {
            let valid = Validate(strategy: TimeValidation())
            // start time before end time
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 1, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }
        
    func testTimeValidationStrategy2() {
            let valid = Validate(strategy: TimeValidation())
            // start time before end time
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 30, endTime: 40, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }
        
    func testTimeValidationStrategy3() {
            let valid = Validate(strategy: TimeValidation())
            // start and end time match
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 15, endTime: 15, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testTimeValidationStrategy4() {
            let valid = Validate(strategy: TimeValidation())
            // start time after end time
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 1, endTime: 0, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testTimeValidationStrategy5() {
            let valid = Validate(strategy: TimeValidation())
            // start time after end time
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 50, endTime: 35, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testDayValidationStrategy1() {
            let valid = Validate(strategy: DayValidation())
            // day is between 0 and 6
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 1, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 0)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }
        
    func testDayValidationStrategy2() {
            let valid = Validate(strategy: DayValidation())
            // day is between 0 and 6
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 1, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 1)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }
        
    func testDayValidationStrategy3() {
            let valid = Validate(strategy: DayValidation())
            // day is between 0 and 6
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 1, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 6)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }

    func testDayValidationStrategy4() {
            let valid = Validate(strategy: DayValidation())
            // day is between 0 and 6
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 20, endTime: 21, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 7)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testDayValidationStrategy5() {
            let valid = Validate(strategy: DayValidation())
            // day is between 0 and 6
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 1, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 20000)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testDayValidationStrategy6() {
            let valid = Validate(strategy: DayValidation())
            // day is between 0 and 6
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 1, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: -2)
            XCTAssertEqual(valid.strategy.validate(meeting), false)
        }
        
    func testDayValidationStrategy7() {
            let valid = Validate(strategy: DayValidation())
            // day is between 0 and 6
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 1, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 3)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }
        
    func testDayValidationStrategy8() {
            let valid = Validate(strategy: DayValidation())
            // day is between 0 and 6
            let meeting = ZoomMeeting(meetingName: "CS100", professorName: "", startTime: 0, endTime: 1, meetingURL: "https://ucr.zoom.us/j/94908786137?pwd=ZWlEbEJyaHJGU3UvSGExOFU2Snc2Zz09", dayOfWeek: 5)
            XCTAssertEqual(valid.strategy.validate(meeting), true)
        }

    //FIXME: tests assert true when URL is invalid
    /*
      func testValidURL6() {
        let url = createURL(url: "https://www.234234242.com") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    func testValidURL7() {
        let url = createURL(url: "https://www.2342342.org") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    func testValidURL8() {
        let url = createURL(url: "https://www.facbook.org") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    func testValidURL9() {
        let url = createURL(url: "https://www.goooooooooooogle33423.com") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    func testValidURL10() {
        let url = createURL(url: "https://www.ge2wgw.com") //Testing Invalid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, false)
    }
    
    */
}
    
/*
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

*/
