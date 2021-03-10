//
//  NotificationManager.swift
//  Zoom Scheduler
//
//  Created by Francisco Bustamante on 3/9/21.
//

import Foundation
import UserNotifications


protocol NotificationManagerDelegate {
    // for delegate
}

//Singleton class to manage local notifications
class NotificationManager: NSObject, UNUserNotificationCenterDelegate {
    
    
    static let shared = NotificationManager()
    
    let notificationCenter = UNUserNotificationCenter.current()
    
    func cancelAll() {
        notificationCenter.removeAllPendingNotificationRequests()
    }
    
    func allNotifications() {
        // see what pedning notifications and requests we have
        notificationCenter.getPendingNotificationRequests(completionHandler: { requests in
            for request in requests {
                print(request)
            }
        })
        notificationCenter.getDeliveredNotifications { notifications in
            for n in notifications {
                print(n)
            }
        }
    }
    
    
    // add a notification for each meeting
    func addNotification(meeting: ZoomMeeting) {
        
        let content = UNMutableNotificationContent()
        content.title = "Join meeting"
        content.body = "\(meeting.meetingName!) starts now"
        content.sound = .default
        
        let components = getComponents(meeting: meeting)
        if (components.day != nil) && (components.hour != nil) && (components.minute != nil) {
            
            // trigger meeting notification on x day, at x hour, minute
            let trigger = UNCalendarNotificationTrigger(dateMatching: DateComponents(hour: components.hour, minute: components.minute, weekday: components.day), repeats: true)
        
            let uuidString = UUID().uuidString
            let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
            
            notificationCenter.add(request) { (error) in
                if let error = error {
                    print("Error: ", error)
                }
            }
        }
    }
    
    
    //Ask user for notification permissions
    func requestNotificationAuthorization() {
        let authorizationOptions = UNAuthorizationOptions.init(arrayLiteral: .alert, .badge, .sound)
        
        self.notificationCenter.requestAuthorization(options: authorizationOptions) { (success, error) in
            if let error = error {
                print("Error: ", error)
            }
            
            if success && error == nil {
                // self.sendNotification()
            }
        }
    }
    
    func sendNotification() {
        // create notification
        let content = UNMutableNotificationContent()
        content.title = "Join Meeting"
        content.body = "meeting starts in 5 minutes"
        content.sound = .default
        // set trigger time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 60, repeats: true)
        let uuidString = UUID().uuidString
        let request = UNNotificationRequest(identifier: uuidString, content: content, trigger: trigger)
        // add notification to center
        notificationCenter.add(request) { (error) in
            if let error = error {
                print("Notification Error: ", error)
            }
        }
    }

    func scheduleNotifications() {
        UNUserNotificationCenter.current().getNotificationSettings { settings in
            
            switch settings.authorizationStatus {
            case .notDetermined:
                // do not have permission
                self.requestNotificationAuthorization()
            case .authorized, .provisional:
                // send notifications
           //     self.sendNotification()
            break
            default:
                break // Do nothing
            }
        }
    }
    
    
}

extension NotificationManager : NotificationManagerDelegate {
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler(UNNotificationPresentationOptions.alert)
    }
    
}
