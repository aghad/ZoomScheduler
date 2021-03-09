//
//  MainVC+table.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/21/21.
//

import Foundation
import UIKit
import RealmSwift


extension MainVC : UITableViewDelegate, UITableViewDataSource {
    //swipe left to edit meeting
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive, title: "Edit", handler: { (action, view, completionHandler) in

                let vc = MeetingVC()
                vc.modalPresentationStyle = .overFullScreen
                let meeting = self.sections[indexPath.section].items[indexPath.row]
                vc.setForm(meeting: meeting)
                self.present(vc, animated: true, completion: nil)
                
                completionHandler(true)
            })
            action.backgroundColor = .systemBlue
            let configuration = UISwipeActionsConfiguration(actions: [action])
            return configuration
        }
    
    
    //swiping right to delete meeting
    @available(iOS 11, *)
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let action = UIContextualAction(style: .destructive, title: "Delete", handler: { (action, view, completionHandler) in
                
                // remove item from Realm results
                self.realm.deleteMeeting(self.sections[indexPath.section].items[indexPath.row])
                self.meetingTable.reloadData()
                completionHandler(true)
            })
            action.backgroundColor = .systemRed
            let configuration = UISwipeActionsConfiguration(actions: [action])
            return configuration
        }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MeetingCell", for: indexPath) as? MeetingCell {
            let meeting = sections[indexPath.section].items[indexPath.row]
            cell.delegate = self
            cell.setup(meeting: meeting)
            return cell
            
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let sectionTitle = sections[section].title
        // create a view with a label in it and return that view
        // the view will have a width equal to screen width
        let width: CGFloat = UIScreen.main.bounds.width
        let height: CGFloat = 21
        let sectionVw = UIView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        let sectionLbl = UILabel()
        sectionVw.addSubview(sectionLbl)
        sectionLbl.frame = CGRect(x: 20, y: 4, width: width - 40, height: height)
        sectionLbl.textColor = .darkGray
        sectionLbl.text = sectionTitle
        sectionLbl.font = UIFont(name: "Avenir-Medium", size: 17)
        sectionLbl.textAlignment = .left
        sectionLbl.numberOfLines = 1
        sectionVw.backgroundColor = .white
        return sectionVw
    }
    
    // Sections for days we have meetings
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }



}

extension MainVC: MeetingCellDelegate {
    
    func joinMeetingTapped(cell: MeetingCell) {
        if let indexPath = meetingTable.indexPath(for: cell) {
            let meeting = self.sections[indexPath.section].items[indexPath.row] //results?[indexPath.row]
            if let meeting_url = meeting.meetingURL{
                if let url = createURL(url: meeting_url){
                    if isURlValid(url: url){
                        print("url \(url)")
                        UIApplication.shared.open(url)
                    }
                }
            }
        }
    }
}

