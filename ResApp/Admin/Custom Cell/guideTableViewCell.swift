//
//  guideTableViewCell.swift
//  ResApp
//
//  Created by Vidya Srinivasa Kesarla on 28/03/19.
//  Copyright © 2019 sjbit. All rights reserved.
//

import UIKit

class guideTableViewCell: UITableViewCell {
    @IBOutlet weak var guideName: UILabel!
    
    @IBOutlet weak var guideUid: UILabel!
    @IBOutlet weak var guideImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
