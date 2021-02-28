//
//  PickerviewCell.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/23/21.
//

import Foundation
import UIKit


class PickerviewCell: UITableViewCell, UITextFieldDelegate {
    
    var time1: String? = ""
    var time2: String? = ""
    
    static let id = "PickerviewCell"
    var referenceNode: PickerViewNode?
    
    let pickerVw: UIPickerView = UIPickerView()
    
    let fieldLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 16)!
        lbl.textAlignment = .left
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .darkGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    let textField: UITextField = {
        let field = UITextField()
        field.backgroundColor = .clear
        field.font = UIFont(name: "Avenir-Medium", size: 18)
        field.borderStyle = UITextField.BorderStyle.none
        field.textColor = .darkGray
        field.tintColor = .darkGray
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        return field
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    func setup(node: PickerViewNode) {
        self.referenceNode = node
        
        // has previous input
        if let input = node.input {
            if node.name == .day {
                textField.text = weekDays[input]
            } else {
                textField.text = timeMapto[input]
            }
        } else { // no input set yet
            textField.text = nil
        }
        
        fieldLbl.text = node.name.rawValue
        textField.placeholder = node.prompt
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = .white
        // set delegates
        textField.delegate = self
        pickerVw.delegate = self
        pickerVw.dataSource = self
        addLayout()
        // have delegate trigger picker view
        // instead of keyboard to select day / time
        textField.inputView = pickerVw
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func addLayout() {
        fieldLbl.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, Padding.leading),top: (self.contentView.topAnchor, 0), height: Padding.height)
        textField.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, 20), trailing: (self.contentView.trailingAnchor, -20), top: (fieldLbl.bottomAnchor, 0), bottom: (self.contentView.bottomAnchor,-10), height: 50)
    }
    
    
    // resign textfield delegate when scrolling
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if textField.isFirstResponder {
            textField.resignFirstResponder()
        }
    }

    
}
    

extension PickerviewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        if self.referenceNode?.name == .day {
            return 1 //one day of week
        }
        else {
            return 2 //Time of day (am/pm)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if self.referenceNode?.name == .day {
            if component == 0 {
                return weekDays.count
            } else {
                return 0
            }
        } else {
            if component == 0 {
                return timeOfDay.count
            } else {
                return ampm.count
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if self.referenceNode?.name == .day {
            if component == 0{
                return weekDays[row]
            } else {
                return nil
            }
            
        } else {
            if component == 0{
                return timeOfDay[row]
            } else {
                return ampm[row]
            }
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if self.referenceNode?.name == .day {
            textField.text = weekDays[row]
            if let text = textField.text {
            referenceNode?.input = fromWeekDays[text]
            }
        } else {
            if component == 0 {
                // ex: 5:00
                self.time1 = timeOfDay[row]
            } else {
                //ex: pm
                self.time2 = ampm[row]
            }
            textField.text = "\(self.time1!) \(self.time2!)"
            if let text = textField.text {
                referenceNode?.input = timeMapFrom[text]
            }
        }
    }
}
