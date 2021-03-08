//
//  MeetingCell.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/21/21.
//

import Foundation
import UIKit

protocol MeetingCellDelegate {
    func joinMeetingTapped(cell: MeetingCell)
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
        lbl.minimumScaleFactor = 0.5
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = .darkGray
        lbl.numberOfLines = 1
        return lbl
    }()
    let startTimeLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 18)!
        lbl.textAlignment = .left
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .gray
        lbl.minimumScaleFactor = 0.8
        lbl.adjustsFontSizeToFitWidth = true
        lbl.baselineAdjustment = .none
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let endTimeLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 18)!
        lbl.textAlignment = .left
        lbl.isUserInteractionEnabled = true
        lbl.minimumScaleFactor = 0.8
        lbl.adjustsFontSizeToFitWidth = true
        lbl.textColor = .gray
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let professorLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 18)!
        lbl.textAlignment = .left
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .gray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    // 'Join Meeting' Btn
    
    let joinMeetingLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 18)!
        lbl.textAlignment = .center
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .white
        lbl.text = "Join Meeting"
        lbl.adjustsFontSizeToFitWidth = true
        lbl.minimumScaleFactor = 0.6
        lbl.numberOfLines = 1
        return lbl
    }()
    
    let joinMeetingVw: UIView = {
        let vw = UIView()
        vw.isUserInteractionEnabled = true
        vw.layer.cornerRadius = 6
        vw.backgroundColor = .systemBlue
        return vw
    }()
    
    enum Padding {
        static let leading: CGFloat = 20
        static let top: CGFloat = 10
        static let spacing: CGFloat = 25
        static let lineSpacing: CGFloat = 8
        static let width: CGFloat = (UIScreen.main.bounds.width / 3)
        static let center: CGFloat = 20
        static let labelSpace: CGFloat = 5
        static let btnWidth: CGFloat = 110
        static let lblWidth: CGFloat = 65
    }
  
    
    // add layout
    private func layoutCell() {
        startTimeLbl.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, Padding.leading), top: (self.contentView.topAnchor, Padding.top), width: Padding.lblWidth)
        
        endTimeLbl.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, Padding.leading), top: (startTimeLbl.bottomAnchor, Padding.lineSpacing), bottom: (self.contentView.bottomAnchor, -Padding.top), width: Padding.lblWidth)
        
        
        joinMeetingVw.addLayout(parentVw: self.contentView,trailing: (self.contentView.trailingAnchor, -Padding.leading), top: (startTimeLbl.topAnchor, Padding.lineSpacing), bottom: (endTimeLbl.bottomAnchor, -Padding.lineSpacing), width: Padding.btnWidth)
        
        joinMeetingLbl.addLayout(parentVw: joinMeetingVw, leading: (joinMeetingVw.leadingAnchor, Padding.labelSpace), trailing: (joinMeetingVw.trailingAnchor, -Padding.labelSpace), top: (joinMeetingVw.topAnchor, Padding.labelSpace), bottom: (joinMeetingVw.bottomAnchor, -Padding.labelSpace))
        
        meetingNameLbl.addLayout(parentVw: self.contentView, leading: (startTimeLbl.trailingAnchor, Padding.spacing), trailing: (joinMeetingVw.leadingAnchor, -Padding.spacing), top: (startTimeLbl.topAnchor, 0))
        
        professorLbl.addLayout(parentVw: self.contentView, leading: (meetingNameLbl.leadingAnchor, 0), trailing: (joinMeetingVw.leadingAnchor, -Padding.spacing), top: (meetingNameLbl.bottomAnchor, Padding.lineSpacing))
    //    endTimeLbl.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, Padding.leading), bottom: (professorLbl.bottomAnchor, 0), width: Padding.lblWidth)
        }
    
    func setup(meeting: ZoomMeeting) {
        self.contentView.backgroundColor = .white
        meetingNameLbl.text = meeting.meetingName
        professorLbl.text = meeting.professorName
        
        startTimeLbl.text = timeMapto[meeting.startTime]
        endTimeLbl.text = timeMapto[meeting.endTime]
        
        layoutCell()
        addGestures()
    }
    
    // avoid reuse bugs
    override func prepareForReuse() {
        super.prepareForReuse()
        meetingNameLbl.removeFromSuperview()
        professorLbl.removeFromSuperview()
        startTimeLbl.removeFromSuperview()
        endTimeLbl.removeFromSuperview()
        joinMeetingLbl.removeFromSuperview()
        joinMeetingVw.removeFromSuperview()
    }
    
// Gestures
    
    @objc func _joinMeetingTapped() {
        delegate?.joinMeetingTapped(cell: self)
    }
    
    func addGestures() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(_joinMeetingTapped))
        joinMeetingVw.addGestureRecognizer(tap)
    }
}
