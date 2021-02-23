//
//  MeetingCell.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/21/21.
//

import Foundation
import UIKit

protocol MeetingCellDelegate {
    
}

class MeetingCell: UITableViewCell {

    var delegate: MeetingCellDelegate?


    override func awakeFromNib() {
        super.awakeFromNib()
    }

    
    let meetingNameLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 18)!
        lbl.textAlignment = .left
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .darkGray
        lbl.numberOfLines = 0
        return lbl
    }()
  
    
    // add layout
    private func layoutCell()
    //Add layout later
        {
            meetingNameLbl.fill(self.contentView)
        }
    
    func setup(meeting: ZoomMeeting) {
        
        meetingNameLbl.text = meeting.meetingName
        layoutCell()
        self.contentView.backgroundColor = .clear
    }
    
    // avoid reuse bugs
    override func prepareForReuse() {
        super.prepareForReuse()
        meetingNameLbl.removeFromSuperview()
    }
    

}
