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
        return meetings.count
    }


    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "MeetingCell", for: indexPath) as? MeetingCell {
            let meeting = meetings[indexPath.row]
           // cell.delegate = self
            cell.setup(meeting: meeting)
            return cell
            
        } else {
            return UITableViewCell()
        }
    }



}
