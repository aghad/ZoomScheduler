//
//  Extensions.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/21/21.
//

import Foundation
import UIKit


//custom auto layout function
extension UIView {

    private func prepareForConstraints(with parentFrame: CGRect, in parentVw: UIView) {
        self.frame = parentFrame
        parentVw.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func addLayout(parentVw: UIView, leading: (anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, con: CGFloat)? = nil, trailing: (anchor: NSLayoutAnchor<NSLayoutXAxisAnchor>, con: CGFloat)? = nil, top: (anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, con: CGFloat)? = nil, bottom: (anchor: NSLayoutAnchor<NSLayoutYAxisAnchor>, con: CGFloat)? = nil, horiz: NSLayoutAnchor<NSLayoutXAxisAnchor>? = nil, vert: NSLayoutAnchor<NSLayoutYAxisAnchor>? = nil, height: CGFloat? = nil, width: CGFloat? = nil) {
        
        prepareForConstraints(with: parentVw.frame, in: parentVw)
        
        if let leading = leading {
            self.leadingAnchor.constraint(equalTo: leading.anchor, constant: leading.con).isActive = true
        }
        if let trailing = trailing {
            self.trailingAnchor.constraint(equalTo: trailing.anchor, constant: trailing.con).isActive = true
        }
        if let top = top {
            self.topAnchor.constraint(equalTo: top.anchor, constant: top.con).isActive = true
        }
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: bottom.anchor, constant: bottom.con).isActive = true
        }
        if let horiz = horiz {
            self.centerXAnchor.constraint(equalTo: horiz).isActive = true
        }
        if let vert = vert {
            self.centerYAnchor.constraint(equalTo: vert).isActive = true
        }
        if let height = height {
            self.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let width = width {
            self.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
    }
    
    func fill(_ parentVw: UIView, top: CGFloat = 0, bottom: CGFloat = 0, lead: CGFloat = 0, trail: CGFloat = 0) {
        
        self.frame = parentVw.frame
        parentVw.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: parentVw.topAnchor, constant: top).isActive = true
        self.bottomAnchor.constraint(equalTo: parentVw.bottomAnchor, constant: bottom).isActive = true
        self.leadingAnchor.constraint(equalTo: parentVw.leadingAnchor, constant: lead).isActive = true
        self.trailingAnchor.constraint(equalTo: parentVw.trailingAnchor, constant: trail).isActive = true
    }
    
    func fillSuperview(_ parentVw: UIView, top: CGFloat = 0, bottom: CGFloat = 0, lead: CGFloat = 0, trail: CGFloat = 0) {
        
        self.frame = parentVw.frame
        parentVw.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        self.topAnchor.constraint(equalTo: parentVw.superview?.topAnchor ?? parentVw.topAnchor, constant: top).isActive = true
        self.bottomAnchor.constraint(equalTo: parentVw.superview?.bottomAnchor ?? parentVw.bottomAnchor, constant: bottom).isActive = true
        self.leadingAnchor.constraint(equalTo: parentVw.leadingAnchor, constant: lead).isActive = true
        self.trailingAnchor.constraint(equalTo: parentVw.trailingAnchor, constant: trail).isActive = true
    }
    
}


extension UIImage {
    // add padding around image so image stays small, but we have a larger tap target
    // else user taps will be unsucessful tapping small button
    func pad(_ val: CGFloat) -> UIImage {
        return self.withAlignmentRectInsets(UIEdgeInsets(top: val, left: val, bottom: val, right: val))
    }
}

// ex: TextfieldCell.self, "TextfieldCell"
typealias cellClass = (cellClass: AnyClass?, reuseId: String)

extension UITableView {
    // register more than one type of cell when we have
    // muiltiple types of table view cells
    func setup(cells: [cellClass], delegate: UITableViewDelegate?, dataSource: UITableViewDataSource?, separatorStyle: UITableViewCell.SeparatorStyle = .none, rowHeight: CGFloat? = nil) {
        // set delegate and datasource once
        self.delegate = delegate
        self.dataSource = dataSource
        // register each type of cell
        for cell in cells {
            self.register(cell.cellClass, forCellReuseIdentifier: cell.reuseId)
        }
        self.reloadData()
    }
}
