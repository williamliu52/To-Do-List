//
//  TextInputTableViewCell.swift
//  To Do List
//
//  Created by William Liu on 2016-02-19.
//  Copyright © 2016 William Liu. All rights reserved.
//

import Foundation

import UIKit

public class TextInputTableViewCell: UITableViewCell {

    @IBOutlet var textField: UITextField!
    
    public func configure(text: String?, placeholder: String) {
        textField.text = text
        textField.placeholder = placeholder
        
        textField.accessibilityValue = text
        textField.accessibilityLabel = placeholder
    }
}
