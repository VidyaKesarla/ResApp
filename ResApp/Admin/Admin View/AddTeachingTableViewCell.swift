//
//  AddTeachingTableViewCell.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 09/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class AddTeachingTableViewCell: UITableViewCell {
   
    @IBOutlet weak var instname: UILabel!
    @IBOutlet weak var designation: UILabel!
    @IBOutlet weak var degree: UILabel!
    @IBOutlet weak var noofyears: UILabel!
    @IBOutlet weak var to: UILabel!
    @IBOutlet weak var from: UILabel!
    
    @IBOutlet weak var slno: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
