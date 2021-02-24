//
//  FormCell.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/23/21.
//

import Foundation
import UIKit

class FormCell: UITableViewCell {
    
    static let id = "FormCell"
    
    let fieldLbl: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 16)!
        lbl.textAlignment = .left
        lbl.isUserInteractionEnabled = true
        lbl.textColor = .darkGray
        lbl.numberOfLines = 0
        return lbl
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
    func setup(data: String) {
        fieldLbl.text = data
        self.contentView.backgroundColor = .white
        addLayout()
    }
    
    
    func addLayout() {
        fieldLbl.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, Padding.leading),top: (self.contentView.topAnchor, Padding.lineSpacing))
    }
}
