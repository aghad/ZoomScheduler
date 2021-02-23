//
//  MainVC.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/19/21.
//

import Foundation
import UIKit
import RealmSwift

class MainVC: UIViewController {
             
    // Setup Realm
        var meetings = [String]()
        var realm = try! Realm()
        var notificationToken: NotificationToken? = nil
        var results: Results<ZoomMeeting>?
        
        deinit {
            notificationToken?.invalidate()
        }
    
    // 'My Meetings' title
    let myMeetingsLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 24)!
        lbl.textAlignment = .center
        lbl.isUserInteractionEnabled = false
        lbl.textColor = .darkGray
        lbl.text = "My Meetings"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    // show options
    let moreImgVw: UIImageView = {
        let vw = UIImageView()
        vw.image = UIImage(named: "more")?.pad(-15)
        vw.contentMode = .scaleAspectFit
        vw.isUserInteractionEnabled = true
        return vw
    }()
    
    // add a Zoom meeting
    let addMeetingImgVw: UIImageView = {
        let vw = UIImageView()
        vw.image = UIImage(named: "add")?.pad(-30)
        vw.contentMode = .scaleAspectFit
        vw.isUserInteractionEnabled = true
        return vw
    }()
    
    
    // table view of zoom meetings
    var meetingTable: UITableView = {
        let table = UITableView()
        table.separatorStyle = .singleLine
        table.backgroundColor = UIColor.clear
        table.allowsSelection = false
        table.tintColor = .lightGray
        table.separatorColor = .lightGray
        table.allowsSelectionDuringEditing = false
        table.isUserInteractionEnabled = true
        table.separatorStyle = .none
        return table
    }()


    override func viewDidLoad() {
        view.backgroundColor = .white
        meetingTable.register(MeetingCell.self, forCellReuseIdentifier: "MeetingCell")
        meetingTable.delegate = self
        meetingTable.dataSource = self
        // hide line on bottom of table view
        meetingTable.tableFooterView = UIView()
        addLayout()
        setRealm()
        
    }
    
    
    
    func addLayout() {
        myMeetingsLbl.addLayout(parentVw: self.view, top: (self.view.topAnchor, Padding.topPadding), horiz: self.view.centerXAnchor)
        moreImgVw.addLayout(parentVw: self.view, leading: (self.view.leadingAnchor, Padding.leading), vert: myMeetingsLbl.centerYAnchor, height: Padding.moreSize, width: Padding.moreSize)
        addMeetingImgVw.addLayout(parentVw: self.view, trailing: (self.view.trailingAnchor, 0), vert: myMeetingsLbl.centerYAnchor, height: Padding.addSize, width: Padding.addSize)
        meetingTable.addLayout(parentVw: self.view, leading: (self.view.leadingAnchor, 0), trailing: (self.view.trailingAnchor, 0), top: (myMeetingsLbl.bottomAnchor, Padding.spacing), bottom: (self.view.bottomAnchor, 0))
    }

    func setRealm() {
            // if there are any changes to local data (deletions, additions, edits), then update results
            results = realm.objects(ZoomMeeting.self)
            
            // Observe Results Notifications
            notificationToken = results?.observe { [weak self] (changes: RealmCollectionChange) in
                guard let _results = self?.results else {
                    return
                }
                self?.results = _results
                
                // if any changes, reload table
                self?.meetingTable.reloadData()
            }
        }
}
