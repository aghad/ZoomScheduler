//
//  PickerviewCell.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/23/21.
//

import Foundation
import UIKit


class PickerviewCell: UITableViewCell, UITextFieldDelegate {
    
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
    

    
}
    

extension PickerviewCell: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 0
    }
    
    
}
