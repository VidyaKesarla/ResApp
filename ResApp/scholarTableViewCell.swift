//
//  scholarTableViewCell.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 02/04/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class scholarTableViewCell: UITableViewCell {

    @IBOutlet weak var scholarName: UILabel!
    @IBOutlet weak var scholarImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
