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
