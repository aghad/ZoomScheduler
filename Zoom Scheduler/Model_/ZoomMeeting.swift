//
//  ZoomMeeting.swift
//  Zoom Scheduler
//
//  Created by Aden on 2/22/21.
//

import Foundation
import UIKit
import RealmSwift

class ZoomMeeting : Object {
    
    // meeting name
    @objc dynamic var meetingName: String? = nil
    @objc dynamic var professorName: String? = nil
    @objc dynamic var startTime: Int = 0
    @objc dynamic var endTime: Int = 0
    @objc dynamic var meetingURL: String? = nil
    @objc dynamic var dayOfWeek: Int = 0
    
    convenience init(meetingName:String? = nil,
                     professorName:String? = nil,
                     startTime:Int = 0,
                     endTime:Int = 0,
                     meetingURL:String? = nil,
                     dayOfWeek:Int = 0){
        self.init()
        self.meetingName = meetingName
        self.professorName = professorName
        self.startTime = startTime
        self.endTime = endTime
        self.meetingURL = meetingURL
        self.dayOfWeek = dayOfWeek
    }
    
}
