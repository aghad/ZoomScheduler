//
//  TextfieldCell.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/23/21.
//

import Foundation
import UIKit


class TextfieldCell: UITableViewCell, UITextFieldDelegate {
    
    static let id = "TextfieldCell"
    // keep refence of node passed in
    // so we can access type, name, etc.
    var referenceNode: TextfieldNode?
    
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
        field.autocorrectionType = UITextAutocorrectionType.yes
        field.keyboardType = UIKeyboardType.default
        field.returnKeyType = UIReturnKeyType.done
        field.clearButtonMode = UITextField.ViewMode.whileEditing
        return field
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.delegate = self
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addLayout()
        // set delegate
        textField.delegate = self
        self.contentView.backgroundColor = .white
        // notice changes in textfield
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(node: TextfieldNode) {
        self.referenceNode = node
        // name field with what data we want input by the user
        fieldLbl.text = node.name.rawValue
        // prompt user to enter this kind of data in textield
        textField.placeholder = node.prompt
    }
    
    
    
    
    func addLayout() {
        fieldLbl.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, Padding.leading),top: (self.contentView.topAnchor, Padding.lineSpacing))
        
        textField.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, 20), trailing: (self.contentView.trailingAnchor, -20), top: (fieldLbl.bottomAnchor, 0), bottom: (self.contentView.bottomAnchor,-10), height: 50)
    }
    
    // set input of node
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let text = textField.text {
            referenceNode?.input = text
        }
    }
}
