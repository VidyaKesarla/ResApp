//
//  scholarlistTableViewCell.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 10/05/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class scholarlistTableViewCell: UITableViewCell {

    @IBOutlet weak var schuid: UILabel!
    @IBOutlet weak var checkboximg: UIImageView!
    @IBOutlet weak var scholarname: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
