//
//  MainVC+table.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/21/21.
//

import Foundation
import UIKit


extension MainVC : UITableViewDelegate, UITableViewDataSource {
    

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
        print("tapped")
    }
}
