//
//  CustomFoodCellTableViewCell.swift
//  Amiv
//
//  Created by Gabriel Sonderegger on 13.10.18.
//  Copyright © 2018 Amiv an der ETH. All rights reserved.
//

import UIKit

class CustomFoodCell: UITableViewCell {

    var FoodChoiceLabel :UILabel!
    var TextField : UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
       initalizeLabel()
        initializeTextField()
        
    }
 
    private func initalizeLabel(){
        FoodChoiceLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        FoodChoiceLabel.text = "I'am a test label"
        contentView.addSubview(FoodChoiceLabel)
    }
    
    private func initializeTextField(){
        TextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200, height: 60))
        contentView.addSubview(TextField)
    }
}
