//
//  MeetingVC+table.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/23/21.
//

import Foundation
import UIKit


extension MeetingVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return meetingNodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // get type of form node
        let meetingNode = meetingNodes[indexPath.row]
        
        switch meetingNode.type {
        case .textfield:
            if let textFieldCell = tableView.dequeueReusableCell(withIdentifier: TextfieldCell.id, for: indexPath) as? TextfieldCell, let node = meetingNode as? TextfieldNode {
                textFieldCell.setup(node: node)
                return textFieldCell
            } else {
                return UITableViewCell()
            }
        case .pickerview:
            if let pickerViewCell = tableView.dequeueReusableCell(withIdentifier: PickerviewCell.id, for: indexPath) as? PickerviewCell, let node = meetingNode as? PickerViewNode {
                pickerViewCell.setup(node: node)
                return pickerViewCell
            } else {
                return UITableViewCell()
            }
        case .emptySpace:
            if let emptySpaceCell = tableView.dequeueReusableCell(withIdentifier: EmptySpaceCell.id, for: indexPath) as? EmptySpaceCell, let node = meetingNode as? EmptySpaceNode {
                emptySpaceCell.setup(node: node)
                return emptySpaceCell
            } else {
                return UITableViewCell()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // resign any textfield delegate keyboard when scrolling
        for cell in formTable.visibleCells {
            if let textFieldCell = cell as? TextfieldCell {
                textFieldCell.textField.resignFirstResponder()
            }
        }
    }
    
}
