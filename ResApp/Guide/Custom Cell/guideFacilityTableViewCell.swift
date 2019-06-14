//
//  guideFacilityTableViewCell.swift
//  ResApp
//
//  Created by IOSLevel01 on 08/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class guideFacilityTableViewCell: UITableViewCell {

    @IBOutlet weak var facdesc: UITextView!
    @IBOutlet weak var facimg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
