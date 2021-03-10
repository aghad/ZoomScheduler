//
//  Zoom_SchedulerTests.swift
//  Zoom SchedulerTests
//
//  Created by Destiny Hochhalter Ruiz on 2/19/21.
//

import XCTest
@testable import Zoom_Scheduler

class Zoom_SchedulerTests: XCTestCase {
    
    
    func testDayDictValid() {
        let dictValue = weekDays[0]
        XCTAssertEqual(dictValue, "Monday")
    }
    
    func testDayDictInvalid() {
        let dictValue = weekDays[10]
        XCTAssertEqual(dictValue, nil)
    }
    
    func testTimeDictValid() {
        let dictValue = timeOfDay[131]
        XCTAssertEqual(dictValue, "11:55")
    }
    
    func testTimeDictInvalid() {
        let dictValue = timeOfDay[1000]
        XCTAssertEqual(dictValue, nil)
    }
    
    func testValidURL() {
        let url = createURL(url: "https://www.google.com") //Testing Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL1() {
        let url = createURL(url: "https://www.yahoo.com") //Testing second Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    
    func testValidURL2() {
        let url = createURL(url: "https://www.youtube.com") //Testing second Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL3() {
        let url = createURL(url: "https://www.thenew.org") //Testing second Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testValidURL4() {
        let url = createURL(url: "https://www.facebook.com") //Testing second Valid URL
        let isValid = isURlValid(url: url!)
        XCTAssertEqual(isValid, true)
    }
    
    func testVerifyURL (urlString: String?) -> Bool {
        if let urlString = urlString {
            if let url = NSURL(string: urlString) {
                return UIApplication.shared.canOpenURL(url as URL)
            }
        }
        return false
    }
    
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
    
    func testValidTimeFalse() {
        let time1 = 5
        let time2 = 3
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, false)
    }
    
    func testValidTimeTrue() {
        let time1 = 3
        let time2 = 5
        let isValid = isTimeSelectionValid(time1: time1, time2: time2)
        XCTAssertEqual(isValid, true)
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
    }

    
//    func testDayDictValid() {
//        let dictValue = weekDays[0]
//        XCTAssertEqual(dictValue, "Monday")
//    }
//
//    func testDayDictInvalid() {
//        let dictValue = weekDays[10]
//        XCTAssertEqual(dictValue, nil)
//    }
//
//    func testTimeDictValid() {
//        let dictValue = timeOfDay[131]
//        XCTAssertEqual(dictValue, "11:55")
//    }
//
//    func testTimeDictInvalid() {
//        let dictValue = timeOfDay[1000]
//        XCTAssertEqual(dictValue, nil)
//    }
//

//}

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
    
    
}

    */
    
//}

    
    
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
