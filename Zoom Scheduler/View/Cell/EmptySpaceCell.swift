//
//  EmptySpaceCell.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/27/21.
//

import Foundation
import UIKit


// add extra space to bottom of table view
// so user can always see field when textfield or picker view
// pop up and take space on screen
class EmptySpaceCell: UITableViewCell {
    
    static let id = "EmptySpaceCell"
    var height: CGFloat?
    
    let emptyVw: UIView = {
        let vw = UIView()
        vw.backgroundColor = .white
        return vw
    }()
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(node: EmptySpaceNode) {
        self.height = node.height
        addLayout()
    }

    func addLayout() {
        emptyVw.addLayout(parentVw: self.contentView, leading: (self.contentView.leadingAnchor, 0), trailing: (self.contentView.trailingAnchor, 0), top: (self.contentView.topAnchor,0), bottom: (self.contentView.bottomAnchor, 0), height: self.height)
    }
    
}
