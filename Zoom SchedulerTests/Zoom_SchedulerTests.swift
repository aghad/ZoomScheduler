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
    
    
    
}
    
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
