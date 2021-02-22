//
//  ZoomMeeting.swift
//  Zoom Scheduler
//
//  Created by Francisco Bustamante on 2/21/21.
//

import Foundation
import UIKit

class ZoomMeeting {
    
    // meeting name
    var meetingName: String? = nil
    var professorName: String? = nil
    var startTime: Int = 0
    var endTime: Int = 0
    var meetingURL: String? = nil
    var dayOfWeek: Int = 0
    
    convenience init(meetingName:String? = nil,
                     professorName:String? = nil,
                     startTime:Int = 0,
                     endTime:Int = 0,
                     meetringURL:String? = nil,
                     dayOfWeek:Int = 0){
        self.init()
        self.meetingName = meetingName
        self.professorName = professorName
        self.startTime = startTime
        self.endTime = endTime
        self.meetingURL = meetringURL
        self.dayOfWeek = dayOfWeek
    }
    
}
