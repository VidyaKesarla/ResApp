//
//  GuidesTableViewCell.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 01/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class GuidesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var uid: UILabel!
    
    
    @IBOutlet weak var name: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
