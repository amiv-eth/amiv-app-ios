//
//  CustomTableViewCell.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.createTextField()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func createTextField(){
        
        
        let Label = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 20))
        Label.text = "Food Requierement"
        
        let sampleTextField =  UITextField(frame: CGRect(x: 0, y: 0, width: 500, height: 40))
        sampleTextField.textAlignment = .center
        sampleTextField.placeholder = "Enter text here"
        sampleTextField.font = UIFont.systemFont(ofSize: 15)
        sampleTextField.borderStyle = UITextField.BorderStyle.roundedRect
        sampleTextField.autocorrectionType = UITextAutocorrectionType.no
        sampleTextField.keyboardType = UIKeyboardType.default
        sampleTextField.returnKeyType = UIReturnKeyType.done
        sampleTextField.clearButtonMode = UITextField.ViewMode.whileEditing;
        sampleTextField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        contentView.addSubview(sampleTextField)
        /*
        sampleTextField.widthAnchor.constraint(equalToConstant: 400).isActive = true
        sampleTextField.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        sampleTextField.centerXAnchor.constraint(equalTo: self.contentView.centerXAnchor).isActive = true
        sampleTextField.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        */
    }

}
