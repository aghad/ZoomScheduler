//
//  Nodes.swift
//  Zoom Scheduler
//
//  Created by Destiny Hochhalter Ruiz on 2/23/21.
//

import Foundation
import UIKit


// our form can get user input through
// text input w a textfield,
// or by selecting picker view value
enum NodeType {
    case textfield
    case pickerview
    case emptySpace
}

// base class for table view cell
// cells must share common base class
// this is so we can display differnet types
// of cells in one table view
class BaseNode {
    var type: NodeType
    
    init(type: NodeType) {
        self.type = type
    }
}



// picker view cell will inherit from this class
class PickerViewNode: BaseNode {
    // input is int because we expect a day or time
    // which is type int
    var input: Int? = nil
    // ask user to select x
    var prompt: String = ""
    var name: PickerViewNodeName = .day
    // give node validate stetegy method
    var strategy: Validate?
    var error: PickerViewNodeError?
    
    // initialize node
    init(name: PickerViewNodeName, input: Int?, prompt: String, strategy: Validate?, error: PickerViewNodeError?) {
        super.init(type: .pickerview)
        self.input = input
        self.prompt = prompt
        self.name = name
        self.strategy = strategy
        self.error = error
    }
}



// textfield cell will inherit from this class
class TextfieldNode: BaseNode {
    // expect any existing input to be a string
    // ex: a meeting name
    var input: String? = nil
    // ask user to type in x
    var prompt: String = ""
    var name: TextFieldNodeName = .meetingName
    // give node validate stetegy method
    var strategy: Validate?
    var error: TextFieldNodeError?
    
    // initialize node
    init(name: TextFieldNodeName, input: String?, prompt: String, strategy: Validate?, error: TextFieldNodeError?) {
        super.init(type: .textfield)
        self.input = input
        self.prompt = prompt
        self.name = name
        self.strategy = strategy
        self.error = error
    }
}


// add extra space to bottom of table view
class EmptySpaceNode: BaseNode {
    var height: CGFloat = 0
    
    init(height: CGFloat) {
        super.init(type: .emptySpace)
        self.height = height
    }
}

