//
//  ViewControllerTableViewCell.swift
//  S&T Live
//
//  Created by matthew stroble on 12/4/19.
//  Copyright © 2019 matthew stroble. All rights reserved.
//

import UIKit
import Firebase

class ViewControllerTableViewCell: UITableViewCell {

    
    @IBOutlet weak var lblEventName: UILabel!
    
    @IBOutlet weak var lblLocation: UILabel!
    
    @IBOutlet weak var lblDate: UILabel!
    
    @IBOutlet weak var lblRoomNumber: UILabel!
    
    @IBOutlet weak var lblStartTime: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    

}
