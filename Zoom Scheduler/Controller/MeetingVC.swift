//
//  MeetingVC.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/23/21.
//

import Foundation
import UIKit

class MeetingVC: UIViewController {
    
    let formTable: UITableView = {
        let table = UITableView()
        table.separatorStyle = .singleLine
        table.backgroundColor = UIColor.clear
        table.allowsSelection = false
        table.tintColor = .lightGray
        table.separatorColor = .lightGray
        table.allowsSelectionDuringEditing = false
        table.separatorStyle = .none
        return table
    }()
    
    // 'Add Meeting' title
    let addMeetingLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 24)!
        lbl.textAlignment = .center
        lbl.isUserInteractionEnabled = false
        lbl.textColor = .darkGray
        lbl.text = "Add Meeting"
        lbl.numberOfLines = 1
        return lbl
    }()
    
    // back btn
    let backImgVw: UIImageView = {
        let vw = UIImageView()
        vw.image = UIImage(named: "back")?.pad(-15)
        vw.contentMode = .scaleAspectFit
        vw.tintColor = .gray
        vw.isUserInteractionEnabled = true
        return vw
    }()
    
    // 'Save' label
    let saveLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 18)!
        lbl.textAlignment = .right
        lbl.isUserInteractionEnabled = true
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underlineAttributedString = NSAttributedString(string: "StringWithUnderLine", attributes: underlineAttribute)
        lbl.attributedText = underlineAttributedString
        lbl.text = "Save"
        lbl.adjustsFontSizeToFitWidth = false
        lbl.textColor = .gray
        lbl.numberOfLines = 1
        return lbl
    }()
    
    
    
    // ask for
    // meeting name - textfield
    // meeting url - textfield
    // day - picker view
    // start time - picker view
    // end time - picker view
    // professor name = textfield
    // Form consists of many pickerviews and textfields to populate meeting object...
    
    var meetingNodes: [BaseNode] = [
        // meeitng name
        TextfieldNode(name: TextFieldNodeName.meetingName, input: nil, prompt: FieldNodePrompt.meetingName.rawValue),
        //formToEdit.meetingName?.description
        //Meeting URL
        TextfieldNode(name: TextFieldNodeName.meetingURL, input: nil, prompt: FieldNodePrompt.meetingURL.rawValue),
        // Day of meeting
        PickerViewNode(name: PickerViewNodeName.day, input: nil, prompt: FieldNodePrompt.day.rawValue),
        // Start time
        PickerViewNode(name: PickerViewNodeName.startTime, input: nil, prompt: FieldNodePrompt.startTime.rawValue),
        // End time
        PickerViewNode(name: PickerViewNodeName.endTime, input: nil, prompt: FieldNodePrompt.endTime.rawValue),
        // Professor name
        TextfieldNode(name: TextFieldNodeName.professorName, input: nil, prompt: FieldNodePrompt.professorName.rawValue)
    ]
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        addLayout()
        addGestures()
        formTable.setup(cells: [(TextfieldCell.self,TextfieldCell.id),
                                (PickerviewCell.self,PickerviewCell.id)],
                                 delegate: self, dataSource: self)
        formTable.tableFooterView = UIView()
    }
    
    
    func addLayout() {
        addMeetingLbl.addLayout(parentVw: self.view, top: (self.view.topAnchor, Padding.topPadding), horiz: self.view.centerXAnchor)
        
        backImgVw.addLayout(parentVw: self.view, leading: (self.view.leadingAnchor, Padding.leading), vert: addMeetingLbl.centerYAnchor, height: Padding.moreSize, width: Padding.moreSize)
        
        saveLbl.addLayout(parentVw: self.view, trailing: (self.view.trailingAnchor, -Padding.leading), vert: addMeetingLbl.centerYAnchor, height: Padding.addSize, width: Padding.addSize)
        formTable.addLayout(parentVw: self.view, leading: (self.view.leadingAnchor, 0), trailing: (self.view.trailingAnchor, 0), top: (addMeetingLbl.bottomAnchor, Padding.spacing), bottom: (self.view.bottomAnchor, 0))
    }
    
    
    // Gestures
    
    // back button will go back to MainVC()
    @objc func backTapped() {
        print("back")
        addHapticFeedback()
        // pop off naviagtion stack, show mainVC()
        self.dismiss(animated: true, completion: nil)
    }
    
    func addGestures() {
        let backTap = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        backImgVw.addGestureRecognizer(backTap)
    }
    
}
