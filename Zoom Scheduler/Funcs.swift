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

