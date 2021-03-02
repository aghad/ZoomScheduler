//
//  MeetingVC.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/23/21.
//

import Foundation
import UIKit
import RealmSwift

class MeetingVC: UIViewController {
    
    var realm = try! Realm()
        var notificationToken: NotificationToken? = nil

       
        deinit {
               notificationToken?.invalidate()
           }
    
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
        TextfieldNode(name: TextFieldNodeName.meetingName, input: nil, prompt: FieldNodePrompt.meetingName.rawValue, strategy: Validate(strategy: URLValidation()), error: TextFieldNodeError.meetingName),
        //Meeting URL
        TextfieldNode(name: TextFieldNodeName.meetingURL, input: nil, prompt: FieldNodePrompt.meetingURL.rawValue, strategy: Validate(strategy: URLValidation()), error: TextFieldNodeError.meetingURL),
        // Day of meeting
        PickerViewNode(name: PickerViewNodeName.day, input: nil, prompt: FieldNodePrompt.day.rawValue, strategy: Validate(strategy: DayValidation()), error: PickerViewNodeError.day),
        // Start time
        PickerViewNode(name: PickerViewNodeName.startTime, input: nil, prompt: FieldNodePrompt.startTime.rawValue, strategy: Validate(strategy: TimeValidation()), error: PickerViewNodeError.startTime),
        // End time
        PickerViewNode(name: PickerViewNodeName.endTime, input: nil, prompt: FieldNodePrompt.endTime.rawValue, strategy: Validate(strategy: TimeValidation()), error: PickerViewNodeError.endTime),
        // Professor name
        TextfieldNode(name: TextFieldNodeName.professorName, input: nil, prompt: FieldNodePrompt.professorName.rawValue, strategy: Validate(strategy: StringValidation()), error: TextFieldNodeError.professorName),
        // Add empty space to see all cells
        EmptySpaceNode(height: 350)
    ]
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        addLayout()
        addGestures()
        formTable.setup(cells: [(TextfieldCell.self,TextfieldCell.id),
                                (PickerviewCell.self,PickerviewCell.id),
                                (EmptySpaceCell.self, EmptySpaceCell.id)],
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
    
    @objc func saveTapped() {
        print("save")
        addHapticFeedback()
        
        if let meeting = parseMeetingNodes() {

            // validate form
            let formValidation = isFormValid(meeting: meeting)
            let isValid = formValidation.isValid
            let errorMessage = formValidation.errorMessage

            if isValid {
            // save meeting
            self.realm.addMeeting(meeting) //saving meeting locally
            self.dismiss(animated: true, completion: nil) //returning to main VC
            } else {
                // display respective error message
                showErrorAlert(message: errorMessage!)
            }
        } else {
            // display error message
            showErrorAlert(message: "All fields are required.")
        }
        
    }
    
    func addGestures() {
        let backTap = UITapGestureRecognizer(target: self, action: #selector(backTapped))
        backImgVw.addGestureRecognizer(backTap)
        
        let saveTap = UITapGestureRecognizer(target: self, action: #selector(saveTapped))
        saveLbl.addGestureRecognizer(saveTap)
    }
    
    
    func parseMeetingNodes() -> ZoomMeeting? {
        var meetingName: String?
        var professorName: String?
        var meetingURL: String?
        var day: Int?
        var startTime: Int?
        var endTime: Int?
        
        for node in meetingNodes {
        
            if let node = node as? TextfieldNode{
                switch node.name {
                case .meetingName:
                    meetingName = node.input
                case .meetingURL:
                    meetingURL = node.input
                case .professorName:
                    professorName = node.input
                }
                
            }
            
            if let node = node as? PickerViewNode {
                switch node.name {
                case .day:
                    day = node.input
                case .startTime:
                    startTime = node.input
                case .endTime:
                    endTime = node.input
                }
            }
            
        }
        
        guard let _meetingName = meetingName,
              let _professorName = professorName,
              let _startTime = startTime,
              let _endTime = endTime,
              let _meetingURL = meetingURL,
              let _day = day else { return nil }
        
        
        let meeting = ZoomMeeting(meetingName: _meetingName, professorName: _professorName, startTime: _startTime, endTime: _endTime, meetingURL: _meetingURL, dayOfWeek: _day)
        
        return meeting
    }
    
    
    // if we are editing an existing meeting
    // update form nodes' input w meeting info
    func setForm(meeting: ZoomMeeting) {
        for node in meetingNodes {
        
            if let node = node as? TextfieldNode{
                switch node.name {
                case .meetingName:
                    node.input = meeting.meetingName
                case .meetingURL:
                    node.input = meeting.meetingURL
                case .professorName:
                    node.input = meeting.professorName
                }
                
            }
            
            if let node = node as? PickerViewNode {
                switch node.name {
                case .day:
                    node.input = meeting.dayOfWeek
                case .startTime:
                    node.input = meeting.startTime
                case .endTime:
                    node.input = meeting.endTime
                }
            }
        }
        self.realm.deleteMeeting(meeting)
    }

    // return if form is valid along w any error messages
    func isFormValid(meeting: ZoomMeeting) -> ValidateLog {
    
        for node in meetingNodes {
            if let node = node as? TextfieldNode{
                // let nodes' strategy handle validation
                // for it's type of textfield validation
                let isValid = node.strategy?.validate(meeting)

                
                // return on first error, only show that message
                if !isValid! {
                    return ValidateLog(isValid: isValid!, errorMessage: node.error?.rawValue)
                }
                
            } else if let node = node as? PickerViewNode {
                // let nodes' strategy handle validation
                // for it's type of picker view validation
                let isValid = node.strategy?.validate(meeting)
                
                // return on first error
                if !isValid! {
                    return ValidateLog(isValid: isValid!, errorMessage: node.error?.rawValue)
                }
            }
        }
        // no errors, nil error message
        return ValidateLog(isValid: true, errorMessage: nil)
    }
    
    
    func showErrorAlert(message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "ok", style: .default, handler: nil)
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}
