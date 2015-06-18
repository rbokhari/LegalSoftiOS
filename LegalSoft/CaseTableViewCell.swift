//
//  CaseTableViewCell.swift
//  LegalSoft
//
//  Created by rahman on 1/10/15.
//  Copyright (c) 2015 VE. All rights reserved.
//

import UIKit

class CaseTableViewCell: UITableViewCell {

    @IBOutlet weak var lblFileNo: UILabel!
    @IBOutlet weak var lblDefenderName: UILabel!
    @IBOutlet weak var lblClientName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
